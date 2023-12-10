package dog.cat.punch.order;

public class OrderItemDTO {

	private int od_itemno;
	private String od_num;
	private int pro_no;
	private int od_count;
	private int pro_price;
	private int od_price;
	private String pro_name;
	private int od_totprice;
	private int od_delivercost;
	private int index_no;
	private String pro_filename;
	
	private int quantity;
	
	public void sumPrice() {
		this.od_price = this.od_count * this.pro_price;
	}

	

	public int getOd_itemno() {
		return od_itemno;
	}



	public void setOd_itemno(int od_itemno) {
		this.od_itemno = od_itemno;
	}



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



	public int getPro_price() {
		return pro_price;
	}



	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}



	public int getOd_price() {
		return od_price;
	}



	public void setOd_price(int od_price) {
		this.od_price = od_price;
	}



	public String getPro_name() {
		return pro_name;
	}



	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}



	public int getOd_totprice() {
		return od_totprice;
	}



	public void setOd_totprice(int od_totprice) {
		this.od_totprice = od_totprice;
	}



	public int getOd_delivercost() {
		return od_delivercost;
	}



	public void setOd_delivercost(int od_delivercost) {
		this.od_delivercost = od_delivercost;
	}



	public int getIndex_no() {
		return index_no;
	}



	public void setIndex_no(int index_no) {
		this.index_no = index_no;
	}



	public String getPro_filename() {
		return pro_filename;
	}



	public void setPro_filename(String pro_filename) {
		this.pro_filename = pro_filename;
	}



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	@Override
	public String toString() {
		return "OrderItemDTO [od_itemno=" + od_itemno + ", od_num=" + od_num + ", pro_no=" + pro_no + ", od_count="
				+ od_count + ", pro_price=" + pro_price + ", od_price=" + od_price + ", pro_name=" + pro_name
				+ ", od_totprice=" + od_totprice + ", od_delivercost=" + od_delivercost + ", index_no=" + index_no
				+ ", pro_filename=" + pro_filename + ", quantity=" + quantity + "]";
	}


}
