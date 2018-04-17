import java.util.Scanner;

 class Rectangle{
	private point p1 = new point(); 
	private point p2 = new point();
	private point p3 = new point();
	private point p4 = new point();
	public Rectangle(point p1,point p2){
	}
	public point getP1() {
		return p1;
	}
	public void setP1(double x,double y) {
		this.p1.x = x;
		this.p1.y = y;
	}
	public void setP2(double x,double y) {
		this.p2.x = x;
		this.p2.y = y;
	}
	public Rectangle(point p1,point p2,point p3,point p4){
		
	}
	double length() {
		
		return 2*(p1.x-p2.x)+2*(p1.y-p2.y);
	}
	double area() {
		return (p1.x-p2.x)*(p1.y-p2.y);
	}
}
class point{
	double x,y;
 point(){
	}
}
public class Doit{
	public static void main(String []args) {
		Scanner sc = new Scanner(System.in);
		point p1 = null,p2 = null;
		Rectangle rec = new Rectangle(p1,p2);
		rec.setP1(2.1, 3.2);
		System.out.println(rec.length());
	}
}

