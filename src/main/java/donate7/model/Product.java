package donate7.model;

import java.sql.Date;

public class Product {
	private int pr_no;				
	private int pr_mno;			
	private String pr_proname;			
	private String pr_item;		
	private String pr_content;	
	private int pr_qty;			
	private String pr_price;				
	private String pr_img;
	private String pr_donation;		
	private String pr_approve;
	private String pr_callm;
	private Date pr_date;
	private Date pr_update;
	private int m_no;
	private String m_email;
	private String m_nick;
	private int o_no;
	private String o_email;
	private String o_oname;
	private int no;
	private String email;
	private String nick;	
	
	private int startRow;
	private int endRow;
	
	private String fdp;
	
	private String mymn;
	private String oyon;
	private String yn;
	public String getYn() {
		return yn;
	}
	public void setYn(String yn) {
		this.yn = yn;
	}
	public String getMymn() {
		return mymn;
	}
	public void setMymn(String mymn) {
		this.mymn = mymn;
	}
	public String getOyon() {
		return oyon;
	}
	public void setOyon(String oyon) {
		this.oyon = oyon;
	}
	
	public String getFdp() {
		return fdp;
	}
	public void setFdp(String fdp) {
		this.fdp = fdp;
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
	public Date getPr_update() {
		return pr_update;
	}
	public void setPr_update(Date pr_update) {
		this.pr_update = pr_update;
	}
	public Date getPr_date() {
		return pr_date;
	}
	public void setPr_date(Date pr_date) {
		this.pr_date = pr_date;
	}
	public int getPr_no() {
		return pr_no;
	}
	public void setPr_no(int pr_no) {
		this.pr_no = pr_no;
	}
	public int getPr_mno() {
		return pr_mno;
	}
	public void setPr_mno(int pr_mno) {
		this.pr_mno = pr_mno;
	}
	public String getPr_proname() {
		return pr_proname;
	}
	public void setPr_proname(String pr_proname) {
		this.pr_proname = pr_proname;
	}
	public String getPr_item() {
		return pr_item;
	}
	public void setPr_item(String pr_item) {
		this.pr_item = pr_item;
	}
	public String getPr_content() {
		return pr_content;
	}
	public void setPr_content(String pr_content) {
		this.pr_content = pr_content;
	}
	public int getPr_qty() {
		return pr_qty;
	}
	public void setPr_qty(int pr_qty) {
		this.pr_qty = pr_qty;
	}
	public String getPr_price() {
		return pr_price;
	}
	public void setPr_price(String pr_price) {
		this.pr_price = pr_price;
	}

	public String getPr_img() {
		return pr_img;
	}
	public void setPr_img(String pr_img) {
		this.pr_img = pr_img;
	}
	public String getPr_donation() {
		return pr_donation;
	}
	public void setPr_donation(String pr_donation) {
		this.pr_donation = pr_donation;
	}
	public String getPr_approve() {
		return pr_approve;
	}
	public void setPr_approve(String pr_approve) {
		this.pr_approve = pr_approve;
	}
	public String getPr_callm() {
		return pr_callm;
	}
	public void setPr_callm(String pr_callm) {
		this.pr_callm = pr_callm;
	}
}
