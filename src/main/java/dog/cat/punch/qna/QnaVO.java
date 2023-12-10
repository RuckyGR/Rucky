package dog.cat.punch.qna;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class QnaVO {
	private int qna_seq;
	private String qna_title;
	private String qna_pass;
	private String qna_writer;
	private String qna_content;
	private String qna_filename;
	private Date qna_date;
	private int qna_cnt;
	private String admin_content;
	private Date admin_date;
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	//--------------------------테이블의 컬럼외 추가-----------------------------//
	private String searchCondition; 
	private String searchKeyword; 
	private MultipartFile qna_uploadFile; // 업로드한 파일객체를 담아놓는 객체
	
	private int start; 
	private int listcnt; 
//	--------------------------테이블의 컬럼외 추가-----------------------------//
	
	
	public int getQna_seq() {
		return qna_seq;
	}
	public String getQna_pass() {
		return qna_pass;
	}
	public void setQna_pass(String qna_pass) {
		this.qna_pass = qna_pass;
	}
	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_writer() {
		return qna_writer;
	}
	public void setQna_writer(String qna_writer) {
		this.qna_writer = qna_writer;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public String getQna_filename() {
		return qna_filename;
	}
	public void setQna_filename(String qna_filename) {
		this.qna_filename = qna_filename;
	}
	public Date getQna_date() {
		return qna_date;
	}
	public void setQna_date(Date qna_date) {
		this.qna_date = qna_date;
	}
	public int getQna_cnt() {
		return qna_cnt;
	}
	public void setQna_cnt(int qna_cnt) {
		this.qna_cnt = qna_cnt;
	}
	public String getAdmin_content() {
		return admin_content;
	}
	public void setAdmin_content(String admin_content) {
		this.admin_content = admin_content;
	}
	public Date getAdmin_date() {
		return admin_date;
	}
	public void setAdmin_date(Date admin_date) {
		this.admin_date = admin_date;
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
	public MultipartFile getQna_uploadFile() {
		return qna_uploadFile;
	}
	public void setQna_uploadFile(MultipartFile qna_uploadFile) {
		this.qna_uploadFile = qna_uploadFile;
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
		return "QnaVO [qna_seq=" + qna_seq + ", qna_title=" + qna_title + ", qna_pass=" + qna_pass + ", qna_writer="
				+ qna_writer + ", qna_content=" + qna_content + ", qna_filename=" + qna_filename + ", qna_date="
				+ qna_date + ", qna_cnt=" + qna_cnt + ", admin_content=" + admin_content + ", admin_date=" + admin_date
				+ ", id=" + id + ", searchCondition=" + searchCondition + ", searchKeyword=" + searchKeyword
				+ ", qna_uploadFile=" + qna_uploadFile + ", start=" + start + ", listcnt=" + listcnt + "]";
	}
	
	
}
