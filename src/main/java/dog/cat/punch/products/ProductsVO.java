package dog.cat.punch.products;

import org.springframework.web.multipart.MultipartFile;

public class ProductsVO {
	private int pro_no;
	private String pro_name;
	private int pro_price;
	private String pro_filename;
	private String pro_descript;
	private String pro_recommended;
	private String pro_country;
	private String pro_expiration_date;
	private String pro_type;
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPro_recommended(String pro_recommended) {
		this.pro_recommended = pro_recommended;
	}
	private String searchCondition;
	private String searchKeyword;
	
	private MultipartFile uploadFile;
	
	private int start;
	private int listcnt;
	
	public int getPro_no() {
		return pro_no;
	}
	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}
	public String getPro_type() {
		return pro_type;
	}
	public void setPro_type(String pro_type) {
		this.pro_type = pro_type;
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
	public String getPro_descript() {
		return pro_descript;
	}
	public void setPro_descript(String pro_descript) {
		this.pro_descript = pro_descript;
	}
	public String getPro_recommended() {
		return pro_recommended;
	}
	public String getPro_country() {
		return pro_country;
	}
	public void setPro_country(String pro_country) {
		this.pro_country = pro_country;
	}
	public String getPro_expiration_date() {
		return pro_expiration_date;
	}
	public void setPro_expiration_date(String pro_expiration_date) {
		this.pro_expiration_date = pro_expiration_date;
	}
	public String getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public MultipartFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getListcnt() {
		return listcnt;
	}
	public void setListcnt(int listcnt) {
		this.listcnt = listcnt;
	}
	public String getPro_filename() {
		return pro_filename;
	}
	public void setPro_filename(String pro_filename) {
		this.pro_filename = pro_filename;
	}
	@Override
	public String toString() {
		return "ProductsVO [pro_no=" + pro_no + ", pro_name=" + pro_name + ", pro_price=" + pro_price
				+ ", pro_descript=" + pro_descript + ", pro_recommended=" + pro_recommended + ", pro_country="
				+ pro_country + ", pro_expiration_date=" + pro_expiration_date + ", pro_type=" + pro_type
				+ ", pro_filename=" + pro_filename + ", searchCondition=" + searchCondition + ", searchKeyword="
				+ searchKeyword + ", uploadFile=" + uploadFile + ", start=" + start + ", listcnt=" + listcnt + "]";
	}

	
	
	
	
	
	
	
	

}
