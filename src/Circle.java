class Circle1 {
	private double Radius;
	String name;
	Circle1(){
		this(5);
	}
	Circle1(double r){
		this.Radius=r;
	}
	public double getRadius() {
		return Radius;
	}
	public void setRadius(double radius) {
		Radius = radius;
	}
}
public class Circle{
	static String compareCircle(Circle1 a,Circle1 b) {
		if(a.getRadius()>=b.getRadius()) {
			return a.name;
		}
		else {
			return b.name;
		}
	}
	public static void main(String []args) {
		Circle1 c1 = new Circle1();
		c1.name="c1";
		Circle1 c2 = new Circle1(8);
		c2.name="c2";
		Circle1 c3 = new Circle1(10);
		c3.name="c3";
		Circle1 c4 = new Circle1(5);
		c4.name="c4";
		System.out.println(compareCircle(c1,c2));
		System.out.println(compareCircle(c1,c3));
		System.out.println(compareCircle(c1,c4));
	}
	
}
