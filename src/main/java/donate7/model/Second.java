package donate7.model;

import java.sql.Date;

public class Second {
	private int sh_no;
	private int sh_mno;
	private String sh_title;
	private String sh_category;
	private String sh_explanation;
	private Date sh_reg_date;
	private String sh_image;
	private String sh_approve;
	private String sh_arrive;
	private int no;
	private String email;
	private String nick;
	private int m_no;
	private String m_email;
	private String m_nick;
	private int o_no;
	private String o_email;
	private String o_oname;
	
	
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_nick() {
		return m_nick;
	}
	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public String getO_email() {
		return o_email;
	}
	public void setO_email(String o_email) {
		this.o_email = o_email;
	}
	public String getO_oname() {
		return o_oname;
	}
	public void setO_oname(String o_oname) {
		this.o_oname = o_oname;
	}
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
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public int getSh_mno() {
		return sh_mno;
	}
	public void setSh_mno(int sh_mno) {
		this.sh_mno = sh_mno;
	}
	public int getSh_no() {
		return sh_no;
	}
	public void setSh_no(int sh_no) {
		this.sh_no = sh_no;
	}
	public String getSh_title() {
		return sh_title;
	}
	public void setSh_title(String sh_title) {
		this.sh_title = sh_title;
	}
	public String getSh_category() {
		return sh_category;
	}
	public void setSh_category(String sh_category) {
		this.sh_category = sh_category;
	}
	public String getSh_explanation() {
		return sh_explanation;
	}
	public void setSh_explanation(String sh_explanation) {
		this.sh_explanation = sh_explanation;
	}
	public Date getSh_reg_date() {
		return sh_reg_date;
	}
	public void setSh_reg_date(Date sh_reg_date) {
		this.sh_reg_date = sh_reg_date;
	}
	public String getSh_image() {
		return sh_image;
	}
	public void setSh_image(String sh_image) {
		this.sh_image = sh_image;
	}
	public String getSh_approve() {
		return sh_approve;
	}
	public void setSh_approve(String sh_approve) {
		this.sh_approve = sh_approve;
	}
	public String getSh_arrive() {
		return sh_arrive;
	}
	public void setSh_arrive(String sh_arrive) {
		this.sh_arrive = sh_arrive;
	}
}
