package dog.cat.punch.review;

import java.util.List;





public interface ReviewService {

	//글등록
	void insertReview(ReviewVO vo);

	//글수정
	ReviewVO selectReview(ReviewVO vo);
	
	//비공개수정
	void updateHide(ReviewVO vo);

	//글삭제
	void deleteReview(ReviewVO vo);

	//글상세 조회
	ReviewVO getReview(ReviewVO vo);

	//글목록 조회
	List<ReviewVO> getReviewList(ReviewVO vo);
	
	//게시물 총 갯수
	public int countReview(ReviewVO vo);
	
	//조회수 카운트
	void updateCnt(ReviewVO vo);

	//신고 접수
	void insertReport(ReviewVO vo);
	
	//신고 목록 및 비공개 처리
	List<ReviewVO> declarationList(ReviewVO vo);

	int updateFilename(ReviewVO vo);

	void u_updateReview(ReviewVO vo);
	
	void deleteReport(ReviewVO vo);

	List<ReviewVO> getMyReview(ReviewVO vo);
	
	//신고목록 총 갯수
	public int countReport(ReviewVO vo);
	
	//내리뷰 총 갯수
	public int countMyReview(ReviewVO vo);

	List<ReviewVO> getReviewProduct(ReviewVO reviewVO);

	


	

	
}
