package helloworld;

import java.util.Scanner;

public class Generic{
	public static void main(String[] args){
		Scanner sc = new Scanner(System.in);
		int k1 = sc.nextInt();
		int v1 = sc.nextInt();
		int k2 = sc.nextInt();
		int v2 = sc.nextInt();
		Pair<Integer,Integer> pp1 = new Pair(k1,v1);
		Pair<Integer,Integer> pp2 = new Pair(k2,v2);
		System.out.print(Ut.compare(pp1, pp2));
	}
}
class Ut{
	public static <K,V> boolean compare(Pair<K,V> p1,Pair<K,V> p2){
		return p1.getKey().equals(p2.getKey())&&p1.getValue().equals(p2.getValue());
	}
}
class Pair<K,V>{
	private K key;
	private V value;
	public Pair(K key,V value){
		this.key=key;
		this.value=value;
	}
	public K getKey() {
		return key;
	}
	public void setKey(K key) {
		this.key = key;
	}
	public V getValue() {
		return value;
	}
	public void setValue(V value) {
		this.value = value;
	}
}