package dog.cat.punch.reserve;

public class ReserveVO {
	
	private String id;
	private int reserve_no;
	private String roomtype;
	private String checkInDate;
	private String checkOutDate;
	private String request;
	private String reserve_check; 
	private String phone;
	private String name;
	private String beautyDog;
	private String petName;
	private String totalPrice;
	private String reserve_YN;
	private int start;
	private int listcnt;
	
	public String getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getBeautyDog() {
		return beautyDog;
	}
	public void setBeautyDog(String beautyDog) {
		this.beautyDog = beautyDog;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(String roomtype) {
		this.roomtype = roomtype;
	}
	public String getCheckInDate() {
		return checkInDate;
	}
	public void setCheckInDate(String checkInDate) {
		this.checkInDate = checkInDate;
	}
	public String getCheckOutDate() {
		return checkOutDate;
	}
	public void setCheckOutDate(String checkOutDate) {
		this.checkOutDate = checkOutDate;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	
	public int getReserve_no() {
		return reserve_no;
	}
	public void setReserve_no(int reserve_no) {
		this.reserve_no = reserve_no;
	}
	public String getReserve_check() {
		return reserve_check;
	}
	public void setReserve_check(String reserve_check) {
		this.reserve_check = reserve_check;
	}
	
	public String getReserve_YN() {
		return reserve_YN;
	}
	public void setReserve_YN(String reserve_YN) {
		this.reserve_YN = reserve_YN;
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
	
	@Override
	public String toString() {
		return "ReserveVO [id=" + id + ", reserve_no=" + reserve_no + ", roomtype=" + roomtype + ", checkInDate="
				+ checkInDate + ", checkOutDate=" + checkOutDate + ", request=" + request + ", reserve_check="
				+ reserve_check + ", phone=" + phone + ", name=" + name + ", beautyDog=" + beautyDog + ", petName="
				+ petName + ", totalPrice=" + totalPrice + ", reserve_YN=" + reserve_YN + ", start=" + start
				+ ", listcnt=" + listcnt + "]";
	}
	
}
