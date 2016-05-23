package donate7.model;

import java.sql.Date;

public class Donate {
	private int d_no;
	private String d_title;
	private int d_member;
	private Date d_reg_date;
	private String d_content;
	private String d_plan;
	private int d_amount;
	private String d_bank;
	private String d_account;
	private String d_img;
	private String d_approve;
	private String d_start_date;
	private String d_end_date;
	public String getD_start_date() {
		return d_start_date;
	}
	public void setD_start_date(String d_start_date) {
		this.d_start_date = d_start_date;
	}
	public String getD_end_date() {
		return d_end_date;
	}
	public void setD_end_date(String d_end_date) {
		this.d_end_date = d_end_date;
	}
	private int o_no;
	private String o_oname;
	private String o_category;
	private int m_no;
	private String m_name;
	public int getD_no() {
		return d_no;
	}
	public void setD_no(int d_no) {
		this.d_no = d_no;
	}
	public String getD_title() {
		return d_title;
	}
	public void setD_title(String d_title) {
		this.d_title = d_title;
	}
	public int getD_member() {
		return d_member;
	}
	public void setD_member(int d_member) {
		this.d_member = d_member;
	}
	public Date getD_reg_date() {
		return d_reg_date;
	}
	public void setD_reg_date(Date d_reg_date) {
		this.d_reg_date = d_reg_date;
	}
	public String getD_content() {
		return d_content;
	}
	public void setD_content(String d_content) {
		this.d_content = d_content;
	}
	public String getD_plan() {
		return d_plan;
	}
	public void setD_plan(String d_plan) {
		this.d_plan = d_plan;
	}
	public int getD_amount() {
		return d_amount;
	}
	public void setD_amount(int d_amount) {
		this.d_amount = d_amount;
	}
	public String getD_bank() {
		return d_bank;
	}
	public void setD_bank(String d_bank) {
		this.d_bank = d_bank;
	}
	public String getD_account() {
		return d_account;
	}
	public void setD_account(String d_account) {
		this.d_account = d_account;
	}
	public String getD_img() {
		return d_img;
	}
	public void setD_img(String d_img) {
		this.d_img = d_img;
	}
	public String getD_approve() {
		return d_approve;
	}
	public void setD_approve(String d_approve) {
		this.d_approve = d_approve;
	}
	public int getO_no() {
		return o_no;
	}
	public void setO_no(int o_no) {
		this.o_no = o_no;
	}
	public String getO_oname() {
		return o_oname;
	}
	public void setO_oname(String o_oname) {
		this.o_oname = o_oname;
	}
	public String getO_category() {
		return o_category;
	}
	public void setO_category(String o_category) {
		this.o_category = o_category;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	
}
