package donate7.model;

import java.sql.Date;

public class DoResult {
	private int d_request;
	private int d_no;	
	private int d_member;
	private Date d_date;
	private int d_donation;
	private String m_nick;
	private int startRow;
	private int endRow;
	
	
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public int getD_request() {
		return d_request;
	}
	public void setD_request(int d_request) {
		this.d_request = d_request;
	}
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public int getD_member() {
		return d_member;
	}
	public void setD_member(int d_member) {
		this.d_member = d_member;
	}
	public Date getD_date() {
		return d_date;
	}
	public void setD_date(Date d_date) {
		this.d_date = d_date;
	}
	public int getD_donation() {
		return d_donation;
	}
	public void setD_donation(int d_donation) {
		this.d_donation = d_donation;
	}
	
}
