package board1;

import java.util.Date;

public class BoardDTO {

//  TABLE : board1
//	IDX          NOT NULL NUMBER         
//	TITLE        NOT NULL VARCHAR2(100)  
//	WRITER       NOT NULL VARCHAR2(50)   
//	CONTEXT      NOT NULL VARCHAR2(2000) 
//	CREATIONDATE NOT NULL DATE           
//	VIEWCOUNT    NOT NULL NUMBER         
//	IPADDR       NOT NULL VARCHAR2(20)
	
	private int idx, viewCount;
	private String title, writer, context, ipaddr;
	private Date creationDate;
	
	// generated getter / setter
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getIpaddr() {
		return ipaddr;
	}
	public void setIpaddr(String ipaddr) {
		this.ipaddr = ipaddr;
	}
	public Date getCreationDate() {
		return creationDate;
	}
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}
}
