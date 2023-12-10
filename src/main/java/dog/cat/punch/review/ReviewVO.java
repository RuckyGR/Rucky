package dog.cat.punch.review;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class ReviewVO {

   private int rev_seq;
   private int rev_star;
   private String rev_writer;
   private String rev_content;
   private MultipartFile rev_uploadFile;
   private String rev_filename;
   private Date rev_regdate;
   private int rev_cnt;
   private int rep_seq;
   private String rep_content;
   private String rep_hide;
   private int pro_no;
   private String pro_name;
   
   private String searchCondition;
	private String searchKeyword;
   
   
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

public String getRep_content() {
      return rep_content;
   }

   public void setRep_content(String rep_content) {
      this.rep_content = rep_content;
   }

   public int getRep_seq() {
      return rep_seq;
   }

   public void setRep_seq(int rep_seq) {
      this.rep_seq = rep_seq;
   }

   public int getRev_cnt() {
      return rev_cnt;
   }

   public void setRev_cnt(int rev_cnt) {
      this.rev_cnt = rev_cnt;
   }

   private int start;
   private int listcnt;
   

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

   public int getRev_seq() {
      return rev_seq;
   }

   public void setRev_seq(int rev_seq) {
      this.rev_seq = rev_seq;
   }

   public int getRev_star() {
      return rev_star;
   }

   public void setRev_star(int rev_star) {
      this.rev_star = rev_star;
   }

   public String getRev_writer() {
      return rev_writer;
   }

   public void setRev_writer(String rev_writer) {
      this.rev_writer = rev_writer;
   }

   public String getRev_content() {
      return rev_content;
   }

   public void setRev_content(String rev_content) {
      this.rev_content = rev_content;
   }

   public MultipartFile getRev_uploadFile() {
      return rev_uploadFile;
   }

   public void setRev_uploadFile(MultipartFile rev_uploadFile) {
      this.rev_uploadFile = rev_uploadFile;
   }

   public String getRev_filename() {
      return rev_filename;
   }

   public void setRev_filename(String rev_filename) {
      this.rev_filename = rev_filename;
   }

   public Date getRev_regdate() {
      return rev_regdate;
   }

   public void setRev_regdate(Date rev_regdate) {
      this.rev_regdate = rev_regdate;
   }

   public String getRep_hide() {
      return rep_hide;
   }

   public void setRep_hide(String rev_hide) {
      this.rep_hide = rev_hide;
   }


public int getPro_no() {
	return pro_no;
}

public void setPro_no(int pro_no) {
	this.pro_no = pro_no;
}


public String getPro_name() {
	return pro_name;
}

public void setPro_name(String pro_name) {
	this.pro_name = pro_name;
}

@Override
public String toString() {
	return "ReviewVO [rev_seq=" + rev_seq + ", rev_star=" + rev_star + ", rev_writer=" + rev_writer + ", rev_content="
			+ rev_content + ", rev_uploadFile=" + rev_uploadFile + ", rev_filename=" + rev_filename + ", rev_regdate="
			+ rev_regdate + ", rev_cnt=" + rev_cnt + ", rep_seq=" + rep_seq + ", rep_content=" + rep_content
			+ ", rep_hide=" + rep_hide + ", pro_no=" + pro_no + ", pro_name=" + pro_name + ", searchCondition="
			+ searchCondition + ", searchKeyword=" + searchKeyword + ", start=" + start + ", listcnt=" + listcnt + "]";
}




}