package dog.cat.punch.review.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dog.cat.punch.review.ReviewVO;

@Repository
public class ReviewDAOmybatis {

	@Autowired
	private SqlSessionTemplate mybatis;
	// DB 커넥션, Mapper, Mapper 설정파일

	// CRUD 기능의 메소드 구현

	// 글 등록
	public void insertReview(ReviewVO vo) {
		System.out.println("===> mybatis insertReview() 기능처리");
		mybatis.insert("ReviewDAO.insertReview", vo);
	}

	// 글 상세
	public ReviewVO selectReview(ReviewVO vo) {
		System.out.println("===> mybatis로 selectReview() 기능처리");
		
		return mybatis.selectOne("ReviewDAO.selectReview", vo);
		
	}
	
	// 비공개 수정
	public void updateHide(ReviewVO vo) {
		System.out.println("===> mybatis로 updateHide() 기능처리");
		mybatis.update("ReviewDAO.updateHide", vo);
	}

	// 글 삭제
	public void deleteReview(ReviewVO vo) {
		System.out.println("===> mybatis로 deleteReview() 기능처리");
		mybatis.delete("ReviewDAO.deleteReview", vo);
	}

	// 글상세 조회
	public ReviewVO getReview(ReviewVO vo) {
		System.out.println("===> mybatis로 getReview() 기능처리");
		return mybatis.selectOne("ReviewDAO.getReview", vo);
	}

	// 글목록 조회
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		System.out.println("===> mybatis로 getReviewList() 기능처리");
		return mybatis.selectList("ReviewDAO.getReviewList", vo);
	}

	// 전체 페이지 수 조회
	public int countReview(ReviewVO vo) {
		System.out.println("===> mybatis로 countReview() 기능처리");
		return mybatis.selectOne("ReviewDAO.countReview", vo);

	}
	
	//조회수 카운트
		public void updateCnt(ReviewVO vo) {
			System.out.println("===>mybatis로 updateCnt() 기능처리");
			mybatis.update("ReviewDAO.updateCnt", vo);
		}

	//신고 접수
		public void insertReport(ReviewVO vo) {
			System.out.println("===> mybatis  insertReport() 기능처리");
			mybatis.insert("ReviewDAO.insertReport", vo);
		}
	// 신고 유무
		public List<ReviewVO> declarationList(ReviewVO vo) {
			System.out.println("===> mybatis로 declarationList() 기능처리" );
			return mybatis.selectList("ReviewDAO.declarationList", vo);
		}
		
	// 이미지 
		public int updateFilename(ReviewVO vo) {
		System.out.println("===>mybatis로 updateFilename() 기능처리"+ vo);
		return mybatis.update("ReviewDAO.updateFilename", vo);
	}

		// 상세보기 수정
		public void u_updateReview(ReviewVO vo) {
			System.out.println("===> mybatis로 u_updateReview() 기능처리");
			mybatis.update("ReviewDAO.u_updateReview", vo);
		}

		// 신고 삭제
		public void deleteReport(ReviewVO vo) {
		System.out.println("===> mybatis로 deleteReport() 기능처리");
		mybatis.delete("ReviewDAO.deleteReport", vo);
		}

		public List<ReviewVO> getMyReview(ReviewVO vo) {
			return mybatis.selectList("ReviewDAO.getMyReview", vo);
		}

		// 신고목록 전체 페이지 수 조회
		public int countReport(ReviewVO vo) {
			System.out.println("===> mybatis로 countReport() 기능처리");
			return mybatis.selectOne("ReviewDAO.countReport", vo);

		}
//		 내 리뷰 페이지 수 조회
		public int countMyReview(ReviewVO vo) {
			System.out.println("===> mybatis로 countMyReview() 기능처리");
			System.out.println("9999999   "  + vo);
			return mybatis.selectOne("ReviewDAO.countMyReview", vo);
			
		}

		public List<ReviewVO> getReviewProduct(ReviewVO reviewVO) {
			return mybatis.selectList("ReviewDAO.getReviewProduct", reviewVO);
		}
	


		
}
