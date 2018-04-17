
public class Fx {
	static int f(int x) {
		return x*x;
	}
	static int f(int x,int y) {
		return x*x+y*y;
	}
	static int f(int x,int y,int z) {
		return x*x+y*y+z*z;
	}
	public static void main(String []args) {
		System.out.println(f(3));
		System.out.println(f(3,4));
		System.out.println(f(3,4,5));
	}
}
