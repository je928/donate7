package donate7.model;

import java.util.Date;

public class Warning {
	private int wa_no;
	private int m_no;
	private int re_no;
	private String wa_sort;
	private int wa_cnt;
	private String wa_re;
	private Date wa_date;
	public int getWa_no() {
		return wa_no;
	}
	public void setWa_no(int wa_no) {
		this.wa_no = wa_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public int getRe_no() {
		return re_no;
	}
	public void setRe_no(int re_no) {
		this.re_no = re_no;
	}
	public String getWa_sort() {
		return wa_sort;
	}
	public void setWa_sort(String wa_sort) {
		this.wa_sort = wa_sort;
	}
	public int getWa_cnt() {
		return wa_cnt;
	}
	public void setWa_cnt(int wa_cnt) {
		this.wa_cnt = wa_cnt;
	}
	public String getWa_re() {
		return wa_re;
	}
	public void setWa_re(String wa_re) {
		this.wa_re = wa_re;
	}
	public Date getWa_date() {
		return wa_date;
	}
	public void setWa_date(Date wa_date) {
		this.wa_date = wa_date;
	}	
}