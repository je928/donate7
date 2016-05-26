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
