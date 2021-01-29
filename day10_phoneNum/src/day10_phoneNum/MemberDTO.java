package day10_phoneNum;

public class MemberDTO {	// Data Transfer Object, 데이터를 전달하는데 사용되는 클래스

	private String name;
	private String pnum;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
}
