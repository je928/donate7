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
	private String o_ok_yn;
	private int no;
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getO_ok_yn() {
		return o_ok_yn;
	}

	public void setO_ok_yn(String o_ok_yn) {
		this.o_ok_yn = o_ok_yn;
	}
/*
	@Override
	public String toString() {
		return "Organ [o_no=" + o_no + ", o_email=" + o_email + ", o_passwd=" + o_passwd + ", o_name=" + o_name
				+ ", o_reg_date=" + o_reg_date + "]";
	}
*/	
}
