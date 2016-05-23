package donate7.model;

import java.sql.Date;

public class VolReq {
	private int vt_No;
	private String vt_Name;
	private int vt_Reg_O_No;
	private Date vt_Reg_Date;
	private String vt_Subject;
	private int vt_Total;
	private char vt_Field;
	private char vt_Cycle;
	private String vt_Start_Date;
	private String vt_End_Date;
	private String vt_Desc;
	private String vt_Mgr;
	private String vt_Mgr_Tel;
	private String vt_Mgr_Email;
	private String vt_Age;
	private String vt_Gender;
	private String vt_Qualify;
	private String vt_Prior_Edu;
	private String vt_Recruit_Yn;

	public String getVt_Recruit_Yn() {
		return vt_Recruit_Yn;
	}

	public void setVt_Recruit_Yn(String vt_Recruit_Yn) {
		this.vt_Recruit_Yn = vt_Recruit_Yn;
	}

	public int getVt_No() {
		return vt_No;
	}

	public void setVt_No(int vt_No) {
		this.vt_No = vt_No;
	}

	public String getVt_Name() {
		return vt_Name;
	}

	public void setVt_Name(String vt_Name) {
		this.vt_Name = vt_Name;
	}

	public int getVt_Reg_O_No() {
		return vt_Reg_O_No;
	}

	public void setVt_Reg_O_No(int vt_Reg_O_No) {
		this.vt_Reg_O_No = vt_Reg_O_No;
	}

	public Date getVt_Reg_Date() {
		return vt_Reg_Date;
	}

	public void setVt_Reg_Date(Date vt_Reg_Date) {
		this.vt_Reg_Date = vt_Reg_Date;
	}

	public String getVt_Subject() {
		return vt_Subject;
	}

	public void setVt_Subject(String vt_Subject) {
		this.vt_Subject = vt_Subject;
	}

	public int getVt_Total() {
		return vt_Total;
	}

	public void setVt_Total(int vt_Total) {
		this.vt_Total = vt_Total;
	}

	public char getVt_Field() {
		return vt_Field;
	}

	public void setVt_Field(char vt_Field) {
		this.vt_Field = vt_Field;
	}

	public char getVt_Cycle() {
		return vt_Cycle;
	}

	public void setVt_Cycle(char vt_Cycle) {
		this.vt_Cycle = vt_Cycle;
	}

	public String getVt_Desc() {
		return vt_Desc;
	}

	public void setVt_Desc(String vt_Desc) {
		this.vt_Desc = vt_Desc;
	}

	public String getVt_Mgr() {
		return vt_Mgr;
	}

	public String getVt_Start_Date() {
		return vt_Start_Date;
	}

	public void setVt_Start_Date(String vt_Start_Date) {
		this.vt_Start_Date = vt_Start_Date;
	}

	public String getVt_End_Date() {
		return vt_End_Date;
	}

	public void setVt_End_Date(String vt_End_Date) {
		this.vt_End_Date = vt_End_Date;
	}

	public void setVt_Mgr(String vt_Mgr) {
		this.vt_Mgr = vt_Mgr;
	}

	public String getVt_Mgr_Tel() {
		return vt_Mgr_Tel;
	}

	public void setVt_Mgr_Tel(String vt_Mgr_Tel) {
		this.vt_Mgr_Tel = vt_Mgr_Tel;
	}

	public String getVt_Mgr_Email() {
		return vt_Mgr_Email;
	}

	public void setVt_Mgr_Email(String vt_Mgr_Email) {
		this.vt_Mgr_Email = vt_Mgr_Email;
	}

	public String getVt_Age() {
		return vt_Age;
	}

	public void setVt_Age(String vt_Age) {
		this.vt_Age = vt_Age;
	}

	public String getVt_Gender() {
		return vt_Gender;
	}

	public void setVt_Gender(String vt_Gender) {
		this.vt_Gender = vt_Gender;
	}

	public String getVt_Qualify() {
		return vt_Qualify;
	}

	public void setVt_Qualify(String vt_Qualify) {
		this.vt_Qualify = vt_Qualify;
	}

	public String getVt_Prior_Edu() {
		return vt_Prior_Edu;
	}

	public void setVt_Prior_Edu(String vt_Prior_Edu) {
		this.vt_Prior_Edu = vt_Prior_Edu;
	}

	@Override
	public String toString() {
		return "VolReq [vt_No=" + vt_No + ", vt_Name=" + vt_Name + ", vt_Reg_O_No=" + vt_Reg_O_No + ", vt_Reg_Date="
				+ vt_Reg_Date + ", vt_Subject=" + vt_Subject + ", vt_Total=" + vt_Total + ", vt_Field=" + vt_Field
				+ ", vt_Cycle=" + vt_Cycle + ", vt_Start_Date=" + vt_Start_Date + ", vt_End_Date=" + vt_End_Date
				+ ", vt_Desc=" + vt_Desc + ", vt_Mgr=" + vt_Mgr + ", vt_Mgr_Tel=" + vt_Mgr_Tel + ", vt_Mgr_Email="
				+ vt_Mgr_Email + ", vt_Age=" + vt_Age + ", vt_Gender=" + vt_Gender + ", vt_Qualify=" + vt_Qualify
				+ ", vt_Prior_Edu=" + vt_Prior_Edu + "]";
	}

}
