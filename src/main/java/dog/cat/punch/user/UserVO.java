package dog.cat.punch.user;

import org.springframework.web.multipart.MultipartFile;

public class UserVO {

	private String id;
	private String password;
	private String password1;
	private String password2;
	private String name;
	private String phone;
	private String phone1;
	private String phone2;
	private String phone3;
	private String email;
	private String regdate;
	private String type;
	private String pet_name;
	private String pet_birth;

	private String leave_status;
	private String leave_date;
	
	private String searchCondition;
	private String searchKeyword;

	private int start;
	private int listcnt;

	private int authNumber;

	private String kakao;
	private String naver;

	private String mail_key;
	private MultipartFile uploadFile; 
	private String filename;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}
	
	// Rest_API_Key ADMIN_KEY 선생님 드릴때는 지우기
	private String REDIRECT_URI = "http://www.dogcatpunch.p-e.kr";
	private String REST_API_KEY = "";
	private String ADMIN_KEY = "";
	private String code;
	
	
	public String getKakao() {
		return kakao;
	}

	public void setKakao(String kakao) {
		this.kakao = kakao;
	}

	public String getNaver() {
		return naver;
	}

	public void setNaver(String naver) {
		this.naver = naver;
	}


	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getREDIRECT_URI() {
		return REDIRECT_URI;
	}

	public void setREDIRECT_URI(String rEDIRECT_URI) {
		REDIRECT_URI = rEDIRECT_URI;
	}

	public String getREST_API_KEY() {
		return REST_API_KEY;
	}

	public void setREST_API_KEY(String rEST_API_KEY) {
		REST_API_KEY = rEST_API_KEY;
	}

	public String getADMIN_KEY() {
		return ADMIN_KEY;
	}

	public void setADMIN_KEY(String aDMIN_KEY) {
		ADMIN_KEY = aDMIN_KEY;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword1() {
		return password1;
	}

	public void setPassword1(String password1) {
		this.password1 = password1;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getPet_name() {
		return pet_name;
	}

	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}

	public String getPet_birth() {
		return pet_birth;
	}

	public void setPet_birth(String pet_birth) {
		this.pet_birth = pet_birth;
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

	public int getAuthNumber() {
		return authNumber;
	}

	public void setAuthNumber(int authNumber) {
		this.authNumber = authNumber;
	}

	public String getMail_key() {
		return mail_key;
	}

	public void setMail_key(String mail_key) {
		this.mail_key = mail_key;
	}

	
	
	public String getLeave_status() {
		return leave_status;
	}

	public void setLeave_status(String leave_status) {
		this.leave_status = leave_status;
	}

	
	public String getLeave_date() {
		return leave_date;
	}

	public void setLeave_date(String leave_date) {
		this.leave_date = leave_date;
	}

	@Override
	public String toString() {
		return "UserVO [id=" + id + ", password=" + password + ", name=" + name + ", phone=" + phone + ", email="
				+ email + ", regdate=" + regdate + ", type=" + type + ", pet_name=" + pet_name + ", pet_birth="
				+ pet_birth +", leave_status =" +leave_status+ ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword + ", start="
				+ start + ", listcnt=" + listcnt + ", authNumber=" + authNumber + ", mail_key=" + mail_key + "]";
	}

}
