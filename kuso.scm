 
(define *symbols* (list (cons #\( 'LeftParen)
                        (cons #\) 'RightParen)
                        (cons #\; 'Semicolon)
                        (cons #\, 'Comma)
                        (cons #\= 'Op_equal)
                        (cons #\* 'Op_multiply)
                        (cons #\/ 'Op_divide)
                        ))
 
(define *keywords* (list (cons 'begin 'Keyword_begin)
                         (cons 'end 'Keyword_end)
                         (cons 'if 'Keyword_if)
                         (cons 'then 'Keyword_then)
                         (cons 'else 'Keyword_else)))
 
(define (read-tokens) 
  (define line 1) 
  (define col 0)
  (define nl_sign #f)
  (define next-char #f) 
  (define (get-next-char) 
    (if (char? next-char)
      (let ((c next-char))
        (set! next-char #f)
        c)
      (let ((c (read-char)))
        (cond ((and (not (eof-object? c))
                    (char=? c #\newline))
               (set! col 0)
               (set! line (+ 1 line))
               (get-next-char))
              (else
                (set! col (+ 1 col))
                c)))))
  (define (push-char c)
    (set! next-char c))
  (define (skip-whitespace+comment)
    (let loop ()
      (let ((c (get-next-char)))
        (cond ((eof-object? c)
               '())
              ((char-whitespace? c) 
               (loop))
               ((char=? c #\#) 
                 (begin 
                   (set! nl_sign #f)
                   (get-next-char)
                   (let m ((c (get-next-char)))
                     (cond  ((char=? (peek-char) #\newline)
                            ()) 
                           (else
                             (m (get-next-char)))))
                   (loop)) ;
                 ) ;
              (else ; 
                (push-char c))))))
  (define (next-token)
  (define (read-string) 
    (let loop ((chars '(#\"))) 
      (cond 
            ((char=? (peek-char) #\") ; " 
             (get-next-char)
             (list->string (reverse (cons #\" chars)))) 
            (else 
              (loop (cons (get-next-char) chars))))))
  (define (read-identifier initial-c) 
    (do ((chars (list initial-c) (cons c chars))
         (c (get-next-char) (get-next-char)))
      ((or (eof-object? c) 
           (not (or (char-numeric? c)
                    (char-alphabetic? c)
                    (char=? c #\_))))
       (push-char c) 
       (string->symbol (list->string (reverse chars))))))
  (define (read-number initial-c) 
    (let loop ((res (digit-value initial-c))
               (c (get-next-char)))
      (cond ((char-alphabetic? c)
             (error (list line "identifier can't begin with number" )))
            ((char-numeric? c)
             (loop (+ (* res 10) (digit-value c))
                   (get-next-char)))
            (else
              (push-char c) 
              res))))
  ;
  (let* ((start-line line)   
         (start-col col)
         (c (get-next-char)))
    (cond ((eof-object? c)
           (list 'End_of_input 0))
          ((or (char-alphabetic? c) (char=? #\_ c))
           (let ((id (read-identifier c)))
             (if (assq id *keywords*)
               (list (cdr (assq id *keywords*)) (car (assq id *keywords*)))
               (list 'Identifier id))))
          ((char-numeric? c) 
           (list 'Integer (read-number c)))
          (else
            (case c
              ((#\( #\) #\{ #\} #\; #\, #\* #\/ #\% #\=)
               (list (cdr (assq c *symbols*)) (car (assq c *symbols*))))
              ((#\+)
              (if (char=? (peek-char) #\+)
                (begin (get-next-char) 
                       (list 'Op_add_self '++))
                (begin (get-next-char) 
                       (list 'Op_add '+))))
              ((#\-)
              (if (char=? (peek-char) #\-) 
                (begin (get-next-char) 
                       (list 'Op_sub_self '--))
                (begin (get-next-char) 
                       (list 'Op_sub '-))))
              ((#\<)
              (case (get-next-char) ((#\=) (begin (get-next-char)(list 'Op_lseq '<=))) 
                    ((#\>) (begin (get-next-char)(list 'Op_unequal '<>)))
                    (else (begin (get-next-char)(list 'Op_less '<)))
                ))
              ((#\>)
              (cond ((char=? (peek-char) #\=) (begin (get-next-char)(list 'Op_lseq '>=))) 
                    (else (begin (get-next-char)(list 'Op_more '>))) 
                ))
              ((#\:)
              (cond ((char=? (peek-char) #\=) (begin (get-next-char)(get-next-char)(list 'Op_assign))) 
                (else (error (list start-line "illegal character" )))
                ))
              ((#\") ; " 
               (list 'String (read-string)))
              (else
                (error (list start-line "illegal character" ))))))))
;
(let loop ((tokens '())) 
  (skip-whitespace+comment)
  (let ((tok (next-token)))
    (if (eof-object? (peek-char)) 
      (reverse (cons tok tokens))
      (loop (cons tok tokens))))))

(define (lexer filename)
(with-input-from-file filename 
                      (read-tokens)))