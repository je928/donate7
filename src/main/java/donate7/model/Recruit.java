package donate7.model;

import java.sql.Date;

public class Recruit {
	 private int vt_no;
	 private String vt_name;
	 private int vt_o_no;
	 private String vt_r_start_date;
	 private String vt_r_end_date;
	 private String vt_a_start_date;
	 private String vt_a_end_date;
	 private int vt_class;
	 private int vt_tot;
	 private int vt_subject;
	 private String vt_desc;
	 private Date vt_reg_date;
	 
	public int getVt_no() {
		return vt_no;
	}
	public void setVt_no(int vt_no) {
		this.vt_no = vt_no;
	}
	public String getVt_name() {
		return vt_name;
	}
	public void setVt_name(String vt_name) {
		this.vt_name = vt_name;
	}
	public int getVt_o_no() {
		return vt_o_no;
	}
	public void setVt_o_no(int vt_o_no) {
		this.vt_o_no = vt_o_no;
	}
	public String getVt_r_start_date() {
		return vt_r_start_date;
	}
	public void setVt_r_start_date(String vt_r_start_date) {
		this.vt_r_start_date = vt_r_start_date;
	}
	public String getVt_r_end_date() {
		return vt_r_end_date;
	}
	public void setVt_r_end_date(String vt_r_end_date) {
		this.vt_r_end_date = vt_r_end_date;
	}
	public String getVt_a_start_date() {
		return vt_a_start_date;
	}
	public void setVt_a_start_date(String vt_a_start_date) {
		this.vt_a_start_date = vt_a_start_date;
	}
	public String getVt_a_end_date() {
		return vt_a_end_date;
	}
	public void setVt_a_end_date(String vt_a_end_date) {
		this.vt_a_end_date = vt_a_end_date;
	}
	public int getVt_class() {
		return vt_class;
	}
	public void setVt_class(int vt_class) {
		this.vt_class = vt_class;
	}
	public int getVt_tot() {
		return vt_tot;
	}
	public void setVt_tot(int vt_tot) {
		this.vt_tot = vt_tot;
	}
	public int getVt_subject() {
		return vt_subject;
	}
	public void setVt_subject(int vt_subject) {
		this.vt_subject = vt_subject;
	}
	public String getVt_desc() {
		return vt_desc;
	}
	public void setVt_desc(String vt_desc) {
		this.vt_desc = vt_desc;
	}
	@Override
	public String toString() {
		return "Recruit [vt_no=" + vt_no + ", vt_name=" + vt_name + ", vt_o_no=" + vt_o_no + ", vt_r_start_date="
				+ vt_r_start_date + ", vt_r_end_date=" + vt_r_end_date + ", vt_a_start_date=" + vt_a_start_date
				+ ", vt_a_end_date=" + vt_a_end_date + ", vt_class=" + vt_class + ", vt_tot=" + vt_tot + ", vt_subject="
				+ vt_subject + ", vt_desc=" + vt_desc + ", vt_reg_date=" + vt_reg_date + "]";
	}
	
}
