package board2;

import java.util.Date;

public class ReplyDTO {

//	IDX      NOT NULL NUMBER        
//	BOARDNUM          NUMBER        
//	WRITER            NUMBER        
//	CONTEXT  NOT NULL VARCHAR2(200) 
//	CREADATE          DATE          
//	DELETED           NUMBER      
	
	private int idx, boardNum, writer, deleted;
	private String context;
	private Date creaDate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public int getDeleted() {
		return deleted;
	}
	public void setDeleted(int deleted) {
		this.deleted = deleted;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public Date getCreaDate() {
		return creaDate;
	}
	public void setCreaDate(Date creaDate) {
		this.creaDate = creaDate;
	}
}
