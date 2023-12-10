package dog.cat.punch.order;

public class OrderPageItemDTO {
	
//	view에서 받을 값
	private int pro_no;
	private int od_count;
	
//	db에서 꺼낼 값
	private String pro_name;
	private int pro_price;
	
//	만들어 낼 값
	private int od_totprice;
	private int od_price;
	private int od_delivercost;
	
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getOd_count() {
		return od_count;
	}
	public void setOd_count(int od_count) {
		this.od_count = od_count;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public int getPro_price() {
		return pro_price;
	}
	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}
	public int getOd_totprice() {
		return od_totprice;
	}
	public void setOd_totprice(int od_totprice) {
		this.od_totprice = od_totprice;
	}
	public int getOd_price() {
		return od_price;
	}
	public void setOd_price(int od_price) {
		this.od_price = od_price;
	}
	
	public void initTotal() {
		this.od_totprice = this.pro_price*this.od_count;
	}
	
	public int getOd_delivercost() {
		return od_delivercost;
	}
	
	public void setOd_delivercost(int od_delivercost) {
		this.od_delivercost = od_delivercost;
	}
	
	@Override
	public String toString() {
		return "OrderPageItemDTO [pro_no=" + pro_no + ", od_count=" + od_count + ", pro_name=" + pro_name
				+ ", pro_price=" + pro_price + ", od_totprice=" + od_totprice + ", od_price=" + od_price
				+ ", od_delivercost=" + od_delivercost + "]";
	}


	
}
