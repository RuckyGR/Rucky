package dog.cat.punch.order;

import java.sql.Date;

public class OrderInfoVO {

	/*
	+------------------+--------------+------+-----+---------------------+-------+
	| Field            | Type         | Null | Key | Default             | Extra |
	+------------------+--------------+------+-----+---------------------+-------+
	| OD_NUM           | varchar(40)  | NO   | PRI | NULL                |       |
	| OD_DATE          | date         | YES  |     | current_timestamp() |       |
	| OD_CDATE         | date         | YES  |     | NULL                |       |
	| ID               | varchar(15)  | NO   | MUL | NULL                |       |
	| OD_TO_NAME       | varchar(20)  | NO   |     | NULL                |       |
	| OD_TO_PHONE      | varchar(15)  | NO   |     | NULL                |       |
	| OD_FROM_NAME     | varchar(20)  | NO   |     | NULL                |       |
	| OD_FROM_PHONE    | varchar(15)  | NO   |     | NULL                |       |
	| OD_FROM_ADDRESS  | varchar(200) | NO   |     | NULL                |       |
	| OD_FROM_MESSAGE  | varchar(50)  | NO   |     | NULL                |       |
	| OD_TOTPRICE      | int(11)      | NO   |     | NULL                |       |
	| OD_DELIVERY      | varchar(100) | NO   |     | NULL                |       |
	| OD_CHECK         | varchar(5)   | YES  |     | Y                   |       |
	| OD_PAYMENT       | varchar(15)  | NO   |     | NULL                |       |
	| od_delivercost   | int(11)      | YES  |     | NULL                |       |
	| od_from_address2 | varchar(200) | NO   |     | NULL                |       |
	| od_from_address3 | varchar(200) | NO   |     | NULL                |       |
	+------------------+--------------+------+-----+---------------------+-------+
*/
	
	private String od_num;
	private Date od_date;
	private Date od_cdate;
	private String id;
	private String od_to_name;
	private String od_to_phone;
	private String od_from_name;
	private String od_from_phone;
	private String od_from_address;
	private String od_from_address2;
	private String od_from_address3;
	private String od_from_message;
	private int od_totprice;
	private String od_delivery;
	private String od_check;
	private String od_payment;
	private int od_delivercost;
	private int od_paid;
	private String od_payname;
	private int od_payprice;
	
	public String getOd_num() {
		return od_num;
	}
	public void setOd_num(String od_num) {
		this.od_num = od_num;
	}
	public Date getOd_date() {
		return od_date;
	}
	public void setOd_date(Date od_date) {
		this.od_date = od_date;
	}
	public Date getOd_cdate() {
		return od_cdate;
	}
	public void setOd_cdate(Date od_cdate) {
		this.od_cdate = od_cdate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOd_to_name() {
		return od_to_name;
	}
	public void setOd_to_name(String od_to_name) {
		this.od_to_name = od_to_name;
	}
	public String getOd_to_phone() {
		return od_to_phone;
	}
	public void setOd_to_phone(String od_to_phone) {
		this.od_to_phone = od_to_phone;
	}
	public String getOd_from_name() {
		return od_from_name;
	}
	public void setOd_from_name(String od_from_name) {
		this.od_from_name = od_from_name;
	}
	public String getOd_from_phone() {
		return od_from_phone;
	}
	public void setOd_from_phone(String od_from_phone) {
		this.od_from_phone = od_from_phone;
	}
	public String getOd_from_address() {
		return od_from_address;
	}
	public void setOd_from_address(String od_from_address) {
		this.od_from_address = od_from_address;
	}
	public String getOd_from_address2() {
		return od_from_address2;
	}
	public void setOd_from_address2(String od_from_address2) {
		this.od_from_address2 = od_from_address2;
	}
	public String getOd_from_address3() {
		return od_from_address3;
	}
	public void setOd_from_address3(String od_from_address3) {
		this.od_from_address3 = od_from_address3;
	}
	public String getOd_from_message() {
		return od_from_message;
	}
	public void setOd_from_message(String od_from_message) {
		this.od_from_message = od_from_message;
	}
	public int getOd_totprice() {
		return od_totprice;
	}
	public void setOd_totprice(int od_totprice) {
		this.od_totprice = od_totprice;
	}
	public String getOd_delivery() {
		return od_delivery;
	}
	public void setOd_delivery(String od_delivery) {
		this.od_delivery = od_delivery;
	}
	public String getOd_check() {
		return od_check;
	}
	public void setOd_check(String od_check) {
		this.od_check = od_check;
	}
	public String getOd_payment() {
		return od_payment;
	}
	public void setOd_payment(String od_payment) {
		this.od_payment = od_payment;
	}
	public int getOd_delivercost() {
		return od_delivercost;
	}
	public void setOd_delivercost(int od_delivercost) {
		this.od_delivercost = od_delivercost;
	}
	public int getOd_paid() {
		return od_paid;
	}
	public void setOd_paid(int od_paid) {
		this.od_paid = od_paid;
	}
	public String getOd_payname() {
		return od_payname;
	}
	public void setOd_payname(String od_payname) {
		this.od_payname = od_payname;
	}
	public int getOd_payprice() {
		return od_payprice;
	}
	public void setOd_payprice(int od_payprice) {
		this.od_payprice = od_payprice;
	}
	
	@Override
	public String toString() {
		return "OrderInfoVO [od_num=" + od_num + ", od_date=" + od_date + ", od_cdate=" + od_cdate + ", id=" + id
				+ ", od_to_name=" + od_to_name + ", od_to_phone=" + od_to_phone + ", od_from_name=" + od_from_name
				+ ", od_from_phone=" + od_from_phone + ", od_from_address=" + od_from_address + ", od_from_address2="
				+ od_from_address2 + ", od_from_address3=" + od_from_address3 + ", od_from_message=" + od_from_message
				+ ", od_totprice=" + od_totprice + ", od_delivery=" + od_delivery + ", od_check=" + od_check
				+ ", od_payment=" + od_payment + ", od_delivercost=" + od_delivercost + ", od_paid=" + od_paid
				+ ", od_payname=" + od_payname + ", od_payprice=" + od_payprice + "]";
	}
	
}
