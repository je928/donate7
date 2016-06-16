package donate7.model;

import java.sql.Date;

public class Community {

	private int brd_no;
	private String brd_subject;
	private String brd_content;
	private int brd_readcount;
	private String brd_ip;
	private Date brd_reg_date;
	private Date brd_update_date;
	private String brd_del_yn;
	private int ref;
	private int re_step;
	private int re_level;
	private int no;
	private String nick;
	private String passwd;
	private int replycount;

	// 조회용
	private int startRow;
	private int endRow;
	// 검색용
	private String searchType;
	private String searchTxt;

	public int getBrd_no() {
		return brd_no;
	}

	public void setBrd_no(int brd_no) {
		this.brd_no = brd_no;
	}

	public String getBrd_subject() {
		return brd_subject;
	}

	public void setBrd_subject(String brd_subject) {
		this.brd_subject = brd_subject;
	}

	public String getBrd_content() {
		return brd_content;
	}

	public void setBrd_content(String brd_content) {
		this.brd_content = brd_content;
	}

	public int getBrd_readcount() {
		return brd_readcount;
	}

	public void setBrd_readcount(int brd_readcount) {
		this.brd_readcount = brd_readcount;
	}

	public String getBrd_ip() {
		return brd_ip;
	}

	public void setBrd_ip(String brd_ip) {
		this.brd_ip = brd_ip;
	}

	public Date getBrd_reg_date() {
		return brd_reg_date;
	}

	public void setBrd_reg_date(Date brd_reg_date) {
		this.brd_reg_date = brd_reg_date;
	}

	public Date getBrd_update_date() {
		return brd_update_date;
	}

	public void setBrd_update_date(Date brd_update_date) {
		this.brd_update_date = brd_update_date;
	}

	public String getBrd_del_yn() {
		return brd_del_yn;
	}

	public void setBrd_del_yn(String brd_del_yn) {
		this.brd_del_yn = brd_del_yn;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRe_step() {
		return re_step;
	}

	public void setRe_step(int re_step) {
		this.re_step = re_step;
	}

	public int getRe_level() {
		return re_level;
	}

	public void setRe_level(int re_level) {
		this.re_level = re_level;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}
	
	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

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

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getSearchTxt() {
		return searchTxt;
	}

	public void setSearchTxt(String searchTxt) {
		this.searchTxt = searchTxt;
	}
	
	public int getReplycount() {
		return replycount;
	}

	public void setReplycount(int replycount) {
		this.replycount = replycount;
	}

}
