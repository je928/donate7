package donate7.model;

import java.sql.Date;

public class Recruit {
	private int vt_no;
	private String vt_name;
	private int vt_o_no;
	private String o_oname;
	private String addr;
	private String cn;
	private Date vt_r_start_date;
	private Date vt_r_end_date;
	private String vt_r_yn;
	private Date vt_a_start_date;
	private Date vt_a_end_date;
	private int vt_class;
	private int vt_dclass;
	private int vt_tot;
	private int vt_subject;
	private String vt_desc;
	private int count;
	private String class_name;
	private String dclass_name;
	private String sub_name;
	private int startrow;
	private int endrow;
	private String searchType;
	private int sido_no;
	private String sido_name;
	private int gugun_no;
	private String gugun_name;
	private int vt_m_no;
	private String vt_time;
	private String vtryn;
	
	public String getVtryn() {
		return vtryn;
	}

	public void setVtryn(String vtryn) {
		this.vtryn = vtryn;
	}

	public String getVt_time() {
		return vt_time;
	}

	public void setVt_time(String vt_time) {
		this.vt_time = vt_time;
	}

	public int getVt_m_no() {
		return vt_m_no;
	}

	public void setVt_m_no(int vt_m_no) {
		this.vt_m_no = vt_m_no;
	}

	public int getSido_no() {
		return sido_no;
	}

	public void setSido_no(int sido_no) {
		this.sido_no = sido_no;
	}

	public String getSido_name() {
		return sido_name;
	}

	public void setSido_name(String sido_name) {
		this.sido_name = sido_name;
	}

	public int getGugun_no() {
		return gugun_no;
	}

	public void setGugun_no(int gugun_no) {
		this.gugun_no = gugun_no;
	}

	public String getGugun_name() {
		return gugun_name;
	}

	public void setGugun_name(String gugun_name) {
		this.gugun_name = gugun_name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getCn() {
		return cn;
	}

	public void setCn(String cn) {
		this.cn = cn;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getO_oname() {
		return o_oname;
	}

	public void setO_oname(String o_oname) {
		this.o_oname = o_oname;
	}

	public int getStartrow() {
		return startrow;
	}

	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}

	public int getEndrow() {
		return endrow;
	}

	public void setEndrow(int endrow) {
		this.endrow = endrow;
	}

	public String getClass_name() {
		return class_name;
	}

	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	
	public String getDclass_name() {
		return dclass_name;
	}

	public void setDclass_name(String dclass_name) {
		this.dclass_name = dclass_name;
	}

	public String getSub_name() {
		return sub_name;
	}

	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

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

	public Date getVt_r_start_date() {
		return vt_r_start_date;
	}

	public void setVt_r_start_date(Date vt_r_start_date) {
		this.vt_r_start_date = vt_r_start_date;
	}

	public Date getVt_r_end_date() {
		return vt_r_end_date;
	}

	public void setVt_r_end_date(Date vt_r_end_date) {
		this.vt_r_end_date = vt_r_end_date;
	}

	public Date getVt_a_start_date() {
		return vt_a_start_date;
	}

	public void setVt_a_start_date(Date vt_a_start_date) {
		this.vt_a_start_date = vt_a_start_date;
	}

	public Date getVt_a_end_date() {
		return vt_a_end_date;
	}

	public void setVt_a_end_date(Date vt_a_end_date) {
		this.vt_a_end_date = vt_a_end_date;
	}

	public String getVt_r_yn() {
		return vt_r_yn;
	}

	public void setVt_r_yn(String vt_r_yn) {
		this.vt_r_yn = vt_r_yn;
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

	public int getVt_dclass() {
		return vt_dclass;
	}

	public void setVt_dclass(int vt_dclass) {
		this.vt_dclass = vt_dclass;
	}

	@Override
	public String toString() {
		return "Recruit [vt_no=" + vt_no + ", vt_name=" + vt_name + ", vt_o_no=" + vt_o_no + ", o_oname=" + o_oname
				+ ", addr=" + addr + ", cn=" + cn + ", vt_r_start_date=" + vt_r_start_date + ", vt_r_end_date="
				+ vt_r_end_date + ", vt_r_yn=" + vt_r_yn + ", vt_a_start_date=" + vt_a_start_date + ", vt_a_end_date="
				+ vt_a_end_date + ", vt_class=" + vt_class + ", vt_dclass=" + vt_dclass + ", vt_tot=" + vt_tot
				+ ", vt_subject=" + vt_subject + ", vt_desc=" + vt_desc + ", count=" + count + ", class_name="
				+ class_name + ", dclass_name=" + dclass_name + ", sub_name=" + sub_name + ", startrow=" + startrow
				+ ", endrow=" + endrow + ", searchType=" + searchType + ", sido_no=" + sido_no + ", sido_name="
				+ sido_name + ", gugun_no=" + gugun_no + ", gugun_name=" + gugun_name + "]";
	}
	
}
