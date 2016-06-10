package donate7.model;

public class Applicant{
	private int m_no;
	private String m_name;
	private String m_email;
	private int m_age;
	private String m_gender;
	private String m_tel;
	private String m_job;
	
	private int vt_no;
	private String vt_sel_yn;
	
	private int wnCount;
	private int totalVolTime;
	
	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getVt_sel_yn() {
		return vt_sel_yn;
	}

	public void setVt_sel_yn(String vt_sel_yn) {
		this.vt_sel_yn = vt_sel_yn;
	}

	public int getVt_no() {
		return vt_no;
	}

	public void setVt_no(int vt_no) {
		this.vt_no = vt_no;
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

	public int getM_age() {
		return m_age;
	}

	public void setM_age(int m_age) {
		this.m_age = m_age;
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

	public int getWnCount() {
		return wnCount;
	}

	public void setWnCount(int wnCount) {
		this.wnCount = wnCount;
	}

	public int getTotalVolTime() {
		return totalVolTime;
	}

	public void setTotalVolTime(int totalVolTime) {
		this.totalVolTime = totalVolTime;
	}
	
}
