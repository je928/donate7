package donate7.model;

import java.sql.Date;

public class Organ {
	private int o_no;
	private String o_email;
	private String o_passwd;
	private String o_license;
	private String o_oname;
	private String o_name;
	private String o_tel;
	private String o_addr;
	private String o_category;
	private Date o_reg_date;
	private Date o_out_date;
	private String o_del_yn;
	private String o_ok_xyn;
	private int no;
	private String post1;
	private String post2;
	private String addr1;
	private String addr2;
	private String o_tel1;
	private String o_tel2;
	private String o_tel3;
	
	// 조회용
	private int startRow;
	private int endRow;

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

	public String getO_passwd() {
		return o_passwd;
	}

	public void setO_passwd(String o_passwd) {
		this.o_passwd = o_passwd;
	}

	public String getO_license() {
		return o_license;
	}

	public void setO_license(String o_license) {
		this.o_license = o_license;
	}

	public String getO_oname() {
		return o_oname;
	}

	public void setO_oname(String o_oname) {
		this.o_oname = o_oname;
	}

	public String getO_name() {
		return o_name;
	}

	public void setO_name(String o_name) {
		this.o_name = o_name;
	}

	public String getO_tel() {
		return o_tel;
	}

	public void setO_tel(String o_tel) {
		this.o_tel = o_tel;
	}

	public String getO_addr() {
		return o_addr;
	}

	public void setO_addr(String o_addr) {
		this.o_addr = o_addr;
	}

	public String getO_category() {
		return o_category;
	}

	public void setO_category(String o_category) {
		this.o_category = o_category;
	}

	public Date getO_reg_date() {
		return o_reg_date;
	}

	public void setO_reg_date(Date o_reg_date) {
		this.o_reg_date = o_reg_date;
	}

	public Date getO_out_date() {
		return o_out_date;
	}

	public void setO_out_date(Date o_out_date) {
		this.o_out_date = o_out_date;
	}

	public String getO_del_yn() {
		return o_del_yn;
	}

	public void setO_del_yn(String o_del_yn) {
		this.o_del_yn = o_del_yn;
	}

	public String getO_ok_xyn() {
		return o_ok_xyn;
	}

	public void setO_ok_xyn(String o_ok_xyn) {
		this.o_ok_xyn = o_ok_xyn;
	}
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
	public String getPost1() {
		return post1;
	}

	public void setPost1(String post1) {
		this.post1 = post1;
	}

	public String getPost2() {
		return post2;
	}

	public void setPost2(String post2) {
		this.post2 = post2;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getO_tel1() {
		return o_tel1;
	}

	public void setO_tel1(String o_tel1) {
		this.o_tel1 = o_tel1;
	}

	public String getO_tel2() {
		return o_tel2;
	}

	public void setO_tel2(String o_tel2) {
		this.o_tel2 = o_tel2;
	}

	public String getO_tel3() {
		return o_tel3;
	}

	public void setO_tel3(String o_tel3) {
		this.o_tel3 = o_tel3;
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
	
/*
	@Override
	public String toString() {
		return "Organ [o_no=" + o_no + ", o_email=" + o_email + ", o_passwd=" + o_passwd + ", o_name=" + o_name
				+ ", o_reg_date=" + o_reg_date + "]";
	}
*/	
}
