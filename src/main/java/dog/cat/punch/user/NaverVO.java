package dog.cat.punch.user;

public class NaverVO {
	//네이버 기본 정보
	//클라이언트 id 클라이언트 시크릿 선생님한테 줄 때는 지우고 주기
	private String client_id = "";
	//private String callback_url = "http://localhost:8090";
	private String callback_url = "http://www.dogcatpunch.p-e.kr";
	private String client_secret ="";
	
	
	// 네이버 로그인 연동 결과 Callback 정보 
	private String code;
	private String state;
	
	
	//접근토근 요청/응답정보
	private String grant_type;
	private String access_token;
	private String refresh_token;
	private String token_type;
	private int expires_in;
	
	
	//공통 - 연동결과 응답정보, 접근토근 응답정보
	private String error;
	private String error_description;
	
	private int inout;
	
	
	public int getInout() {
		return inout;
	}
	public void setInout(int inout) {
		this.inout = inout;
	}
	public String getClient_id() {
		return client_id;
	}
	public void setClient_id(String client_id) {
		this.client_id = client_id;
	}
	public String getCallback_url() {
		return callback_url;
	}
	public void setCallback_url(String callback_url) {
		this.callback_url = callback_url;
	}
	public String getClient_secret() {
		return client_secret;
	}
	public void setClient_secret(String client_secret) {
		this.client_secret = client_secret;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getGrant_type() {
		return grant_type;
	}
	public void setGrant_type(String grant_type) {
		this.grant_type = grant_type;
	}
	public String getAccess_token() {
		return access_token;
	}
	public void setAccess_token(String access_token) {
		this.access_token = access_token;
	}
	public String getRefresh_token() {
		return refresh_token;
	}
	public void setRefresh_token(String refresh_token) {
		this.refresh_token = refresh_token;
	}
	public String getToken_type() {
		return token_type;
	}
	public void setToken_type(String token_type) {
		this.token_type = token_type;
	}
	public int getExpires_in() {
		return expires_in;
	}
	public void setExpires_in(int expires_in) {
		this.expires_in = expires_in;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public String getError_description() {
		return error_description;
	}
	public void setError_description(String error_description) {
		this.error_description = error_description;
	}
	
	@Override
	public String toString() {
		return "NaverVO [client_id=" + client_id + ", callback_url=" + callback_url
				+ ", client_secret=" + client_secret + ", code=" + code + ", state=" + state + ", grant_type="
				+ grant_type + ", access_token=" + access_token + ", refresh_token=" + refresh_token + ", token_type="
				+ token_type + ", expires_in=" + expires_in + ", error=" + error + ", error_description="
				+ error_description + "]";
	}
	
	
}
