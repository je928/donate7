package donate7.model;

import java.sql.Date;

public class Member {

	private int m_no;
	private String m_email;
	private String m_passwd;
	private String m_name;
	private String m_nick;
	private Date m_birth;
	private String m_gender;
	private String m_tel;
	private String m_job;
	private int m_warning;
	private Date m_reg_date;
	private Date m_out_date;
	private String m_del_yn;
	private int no;
	private String passwd;
	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getM_no() {
		return m_no;
	}

	public void setM_no(int m_no) {
		this.m_no = m_no;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_passwd() {
		return m_passwd;
	}

	public void setM_passwd(String m_passwd) {
		this.m_passwd = m_passwd;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_nick() {
		return m_nick;
	}

	public void setM_nick(String m_nick) {
		this.m_nick = m_nick;
	}

	public Date getM_birth() {
		return m_birth;
	}

	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}

	public String getM_gender() {
		return m_gender;
	}

	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getM_job() {
		return m_job;
	}

	public void setM_job(String m_job) {
		this.m_job = m_job;
	}

	public int getM_warning() {
		return m_warning;
	}

	public void setM_warning(int m_warning) {
		this.m_warning = m_warning;
	}

	public Date getM_reg_date() {
		return m_reg_date;
	}

	public void setM_reg_date(Date m_reg_date) {
		this.m_reg_date = m_reg_date;
	}

	public Date getM_out_date() {
		return m_out_date;
	}

	public void setM_out_date(Date m_out_date) {
		this.m_out_date = m_out_date;
	}

	public String getM_del_yn() {
		return m_del_yn;
	}

	public void setM_del_yn(String m_del_yn) {
		this.m_del_yn = m_del_yn;
	}
/*
	@Override
	public String toString() {
		return "Member [m_no=" + m_no + ", m_email=" + m_email + ", m_passwd=" + m_passwd + ", m_name=" + m_name
				+ ", m_reg_date=" + m_reg_date + "]";
	}
*/
}
