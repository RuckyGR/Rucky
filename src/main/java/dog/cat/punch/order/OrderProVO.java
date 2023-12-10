package dog.cat.punch.order;

public class OrderProVO {

//	OD_NUM VARCHAR(40) NOT NULL,
//	PRO_no VARCHAR(200) NOT NULL,
//	OD_COUNT INT(200) NOT NULL,
//	OD_PRICE INT(200) NOT NULL
	
	private String od_num;
	private int pro_no;
	private int od_count;
	private int od_price;
	
	public String getOd_num() {
		return od_num;
	}
	public void setOd_num(String od_num) {
		this.od_num = od_num;
	}
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
	public int getOd_price() {
		return od_price;
	}
	public void setOd_price(int od_price) {
		this.od_price = od_price;
	}
	
	@Override
	public String toString() {
		return "OrderProVO [od_num=" + od_num + ", pro_no=" + pro_no + ", od_count=" + od_count + ", od_price="
				+ od_price + "]";
	}
	
}
