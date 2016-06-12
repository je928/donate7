package donate7.model;

public class CommunityReply {
	private int cr_no;
	private String cr_content;
	private String cr_reg_Date;
	private String cr_update_date;
	private String cr_del_yn;
	private int brd_no;
	private int no;
	private String nick;
	public int getCr_no() {
		return cr_no;
	}
	public void setCr_no(int cr_no) {
		this.cr_no = cr_no;
	}
	public String getCr_content() {
		return cr_content;
	}
	public void setCr_content(String cr_content) {
		this.cr_content = cr_content;
	}
	public String getCr_reg_Date() {
		return cr_reg_Date;
	}
	public void setCr_reg_Date(String cr_reg_Date) {
		this.cr_reg_Date = cr_reg_Date;
	}
	public String getCr_update_date() {
		return cr_update_date;
	}
	public void setCr_update_date(String cr_update_date) {
		this.cr_update_date = cr_update_date;
	}
	public String getCr_del_yn() {
		return cr_del_yn;
	}
	public void setCr_del_yn(String cr_del_yn) {
		this.cr_del_yn = cr_del_yn;
	}
	public int getBrd_no() {
		return brd_no;
	}
	public void setBrd_no(int brd_no) {
		this.brd_no = brd_no;
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
	
}
