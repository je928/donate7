package donate7.model;

import java.sql.Date;

public class Cpoint_info {
	private int cp_no;
	private int m_no;
	private String cp_sort;
	private Date cp_date;
	private int cp_point;
	private String cp_point_re;
	public int getCp_no() {
		return cp_no;
	}
	public void setCp_no(int cp_no) {
		this.cp_no = cp_no;
	}
	public int getM_no() {
		return m_no;
	}
	public void setM_no(int m_no) {
		this.m_no = m_no;
	}
	public String getCp_sort() {
		return cp_sort;
	}
	public void setCp_sort(String sort) {
		this.cp_sort = sort;
	}
	public Date getCp_date() {
		return cp_date;
	}
	public void setCp_date(Date cp_date) {
		this.cp_date = cp_date;
	}
	public int getCp_point() {
		return cp_point;
	}
	public void setCp_point(int cp_point) {
		this.cp_point = cp_point;
	}
	public String getCp_point_re() {
		return cp_point_re;
	}
	public void setCp_point_re(String cp_point_re) {
		this.cp_point_re = cp_point_re;
	}
}