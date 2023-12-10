package dog.cat.punch.review.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dog.cat.punch.review.ReviewService;
import dog.cat.punch.review.ReviewVO;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDAOmybatis reviewDAO;
	

	@Override
	public void insertReview(ReviewVO vo) {
		reviewDAO.insertReview(vo);
	}

	@Override
	public ReviewVO selectReview(ReviewVO vo) {
		return reviewDAO.selectReview(vo);
	}
	
	@Override
	public void updateHide(ReviewVO vo) {
		reviewDAO.updateHide(vo);
	}

	@Override
	public void deleteReview(ReviewVO vo) {
		reviewDAO.deleteReview(vo);
	}

	@Override
	public ReviewVO getReview(ReviewVO vo) {
		return reviewDAO.getReview(vo);
	}

	@Override
	public List<ReviewVO> getReviewList(ReviewVO vo) {
		return reviewDAO.getReviewList(vo);
	}

	@Override
	public int countReview(ReviewVO vo) {
		return reviewDAO.countReview(vo);
	}

	@Override
	public void updateCnt(ReviewVO vo) {
		reviewDAO.updateCnt(vo);
	}
	
	@Autowired
	private ReviewDAOmybatis reportDAO;
	
	@Override
	public void insertReport(ReviewVO vo) {
		reportDAO.insertReport(vo);
		
	}

	@Override
	public List<ReviewVO> declarationList(ReviewVO vo) {
		return reportDAO.declarationList(vo);
		
	}
	@Override
	public int updateFilename(ReviewVO vo) {
		System.out.println("21512"+vo);
		return reviewDAO.updateFilename(vo);
	}
	@Override
	public void u_updateReview(ReviewVO vo) {
		reviewDAO.u_updateReview(vo);
	}
	@Override
	public void deleteReport(ReviewVO vo) {
		reviewDAO.deleteReport(vo);
	}

	@Override
	public List<ReviewVO> getMyReview(ReviewVO vo) {
		return reviewDAO.getMyReview(vo);
	}
	@Override
	public int countReport(ReviewVO vo) {
		return reviewDAO.countReport(vo);
	}
	@Override
	public int countMyReview(ReviewVO vo) {
		return reviewDAO.countMyReview(vo);
	}

	@Override
	public List<ReviewVO> getReviewProduct(ReviewVO reviewVO) {
		return reviewDAO.getReviewProduct(reviewVO);
	}
	
	

}