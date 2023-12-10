package dog.cat.punch.cart;

public class CartVO {
	
	private int cart_no;
	private String id;
	private int pro_no;
	private int quantity;
	private int new_count;
	private String pro_name;
	private int pro_price;
	
	private int sale_price;
	private int total_price;
	
	private String pro_filename;
	
	public String getPro_filename() {
		return pro_filename;
	}
	public void setPro_filename(String pro_filename) {
		this.pro_filename = pro_filename;
	}
	public int getNew_count() { 
		return new_count;
	}
	public void setNew_count(int new_count) {
		this.new_count = new_count;
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
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}
	public int getTotal_price() {
		return quantity * pro_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "CartVO [cart_no=" + cart_no + ", id=" + id + ", pro_no=" + pro_no + ", quantity=" + quantity
				+ ", pro_name=" + pro_name + ", pro_price=" + pro_price + ", sale_price=" + sale_price
				+ ", total_price=" + total_price + "]";
	}
}

