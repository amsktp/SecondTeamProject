package spms.dto;

import java.util.Date;

public class BoardDto {

	private int no;
	private String title;
	private String writer;
	private String contents;
	private Date writeDate;
	
	public BoardDto() {
		super();
	}

	public BoardDto(int no, String title, String writer, String contents, Date writeDate) {
		super();
		this.no = no;
		this.title = title;
		this.writer = writer;
		this.contents = contents;
		this.writeDate = writeDate;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "BoardDto [no=" + no + ", title=" + title + ", writer=" + writer + ", contents=" + contents
				+ ", writeDate=" + writeDate + "]";
	}

}
