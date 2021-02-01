package day21;

public class Greeting {

	// member field
	private String format = "Hello, %s !!";
	
	// member method
	public String greet(String guest) {
		return String.format(format, guest);
	}
	
	public void setFormat(String format) {
		this.format = format;
	}
}
