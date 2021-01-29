package beans;

public class NaverJoin {

	private String userid;
	private String userpw;
	private String userpw2;
	private String username;
	private int year;
	private String month;
	private int date;		// String과 primitive 타입에 대해서 자동형변환을 처리해준다
	private String gender;
	private String email;
	private String locale;
	private String phoneNumber;
	
	public NaverJoin() {}
	
	@Override
	public String toString() {
		return this.username + "(" + this.userid + ")";
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
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getDate() {
		return date;
	}
	public void setDate(int date) {
		this.date = date;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLocale() {
		return locale;
	}
	public void setLocale(String locale) {
		this.locale = locale;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getUserpw2() {
		return userpw2;
	}
	public void setUserpw2(String userpw2) {
		this.userpw2 = userpw2;
	}
}
