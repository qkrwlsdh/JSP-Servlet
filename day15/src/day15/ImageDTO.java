package day15;

public class ImageDTO {

//	IDX              NOT NULL NUMBER        
//	ORIGINALFILENAME NOT NULL VARCHAR2(255) 
//	STOREDFILENAME   NOT NULL VARCHAR2(255)
	
	private int idx;
	private String originalFileName;
	private String storedFileName;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getStoredFileName() {
		return storedFileName;
	}
	public void setStoredFileName(String storedFileName) {
		this.storedFileName = storedFileName;
	}
	
}
