package donate7.model;

import java.sql.Date;

public class Rqn {
	private int vt_rqn_no;
	private int vt_no;
	private int vt_m_no;
	private Date vt_reg_date;
	private String vt_sel_yn;

	public int getVt_rqn_no() {
		return vt_rqn_no;
	}

	public void setVt_rqn_no(int vt_rqn_no) {
		this.vt_rqn_no = vt_rqn_no;
	}

	public int getVt_no() {
		return vt_no;
	}

	public void setVt_no(int vt_no) {
		this.vt_no = vt_no;
	}

	public int getVt_m_no() {
		return vt_m_no;
	}

	public void setVt_m_no(int vt_m_no) {
		this.vt_m_no = vt_m_no;
	}

	public Date getVt_reg_date() {
		return vt_reg_date;
	}

	public void setVt_reg_date(Date vt_reg_date) {
		this.vt_reg_date = vt_reg_date;
	}

	public String getVt_sel_yn() {
		return vt_sel_yn;
	}

	public void setVt_sel_yn(String vt_sel_yn) {
		this.vt_sel_yn = vt_sel_yn;
	}
}
