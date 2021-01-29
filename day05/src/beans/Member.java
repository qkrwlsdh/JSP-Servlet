package beans;

public class Member {

	private String company, bookname;
	private int year;
	
	@Override
	public String toString() {
		String data = "{%s, %s, %s}";
		return String.format(data, company, bookname, year);
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}
}
