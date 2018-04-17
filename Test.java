import java.util.Calendar;

class MyTime {
	MyTime(){
	t = Calendar.getInstance();
	}
	private int Y,M,D,hh,mm,ss;
	Calendar t = null;
	public String getDate() {
		Y = t.get(Calendar.YEAR);
		M = t.get(Calendar.MONTH)+1;
		D = t.get(Calendar.DAY_OF_MONTH);
		return Y+":"+M+":"+D;
	}
	public int getY() {
		return Y;
	}
	public void setY(int y) {
		Y = y;
	}
	public int getM() {
		return M;
	}
	public void setM(int m) {
		M = m;
	}
	public int getD() {
		return D;
	}
	public void setD(int d) {
		D = d;
	}
	public int getHh() {
		return hh;
	}
	public void setHh(int hh) {
		this.hh = hh;
	}
	public int getMm() {
		return mm;
	}
	public void setMm(int mm) {
		this.mm = mm;
	}
	public int getSs() {
		return ss;
	}
	public void setSs(int ss) {
		this.ss = ss;
	}
	String getTime() {
		hh = t.get(Calendar.HOUR_OF_DAY);
		mm = t.get(Calendar.MINUTE);
		ss = t.get(Calendar.SECOND);
		return hh+":"+mm+":"+ss;
	}
	
}
public class Test{
	public static void main(String []args) {
		MyTime a = new MyTime();
		System.out.println(a.getDate());
		System.out.println(a.getTime());
	}
}