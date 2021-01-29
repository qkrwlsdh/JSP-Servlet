package day09;

public class MemberDTO {	// Data Transfer Object, 데이터를 전달하는데 사용되는 클래스

//	-------- -------- ------------- 
//	IDNUMBER NOT NULL VARCHAR2(20)  
//	NAME              VARCHAR2(100) 
//	AGE               NUMBER        
//	GENDER            VARCHAR2(20)  
	
	private String idNumber;
	private String name;
	private int age;
	private String gender;
	
	public String getIdNumber() {
		return idNumber;
	}
	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	
	
}
