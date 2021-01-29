package beans;

public class Account {
	// java beans : JSP에서 데이터의 유형을 지정하고, 입출력을 처리할 수 있는 객체
	// 1) private 멤버필드
	// 2) public getter/setter
	// 3) public 기본생성자 (작성하지 않으면, 자바 가상 머신이 자동으로 생성해준다)
	
	private String userid;
	private String userpw;
	private String username;
	
	public Account() {}		// 기본 생성자는 반드시 존재해야 한다
	
	public Account(String userid, String userpw, String username) {
		this.userid = userid;
		this.userpw = userpw;
		this.username = username;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
}
