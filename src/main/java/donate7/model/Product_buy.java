package donate7.model;

public class Product_buy {
	private int pb_no;
	private String pr_no;
	private int pb_mono;
	private int pb_buyqty;
	private String pb_addr;
	private String pb_name;
	private String pb_tel;
	private String pb_delivery;
	private String nick;
	private String email;
	private int no;
	
	private int startRow;
	private int endRow;

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getPb_no() {
		return pb_no;
	}

	public void setPb_no(int pb_no) {
		this.pb_no = pb_no;
	}

	public String getPr_no() {
		return pr_no;
	}

	public void setPr_no(String pr_no) {
		this.pr_no = pr_no;
	}

	public int getPb_mono() {
		return pb_mono;
	}

	public void setPb_mono(int pb_mono) {
		this.pb_mono = pb_mono;
	}

	public int getPb_buyqty() {
		return pb_buyqty;
	}

	public void setPb_buyqty(int pb_buyqty) {
		this.pb_buyqty = pb_buyqty;
	}

	public String getPb_addr() {
		return pb_addr;
	}

	public void setPb_addr(String pb_addr) {
		this.pb_addr = pb_addr;
	}

	public String getPb_name() {
		return pb_name;
	}

	public void setPb_name(String pb_name) {
		this.pb_name = pb_name;
	}

	public String getPb_tel() {
		return pb_tel;
	}

	public void setPb_tel(String pb_tel) {
		this.pb_tel = pb_tel;
	}

	public String getPb_delivery() {
		return pb_delivery;
	}

	public void setPb_delivery(String pb_delivery) {
		this.pb_delivery = pb_delivery;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

}
