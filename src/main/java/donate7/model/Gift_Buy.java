package donate7.model;

import java.sql.Date;

public class Gift_Buy {
	private int gb_no;
	private int g_no;
	private int m_no;
	private String gb_chk;
	private Date cp_date;

	public int getGb_no() {
		return gb_no;
	}

	public void setGb_no(int gb_no) {
		this.gb_no = gb_no;
	}

	public int getG_no() {
		return g_no;
	}

	public void setG_no(int g_no) {
		this.g_no = g_no;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getGb_chk() {
		return gb_chk;
	}

	public void setGb_chk(String gb_chk) {
		this.gb_chk = gb_chk;
	}

	public Date getCp_date() {
		return cp_date;
	}

	public void setCp_date(Date cp_date) {
		this.cp_date = cp_date;
	}
}
