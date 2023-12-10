package dog.cat.punch.reserve;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dog.cat.punch.review.ReviewVO;
import dog.cat.punch.user.UserVO;

@Repository
public class ReserveDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public int insertReserve(ReserveVO vo) {
		return mybatis.insert("ReserveDAO.insertReserve", vo);
	}
	
	public List<ReserveVO> selReserve(String id){
		return mybatis.selectList("ReserveDAO.selReserve", id);
	}
	
	public int deleteReserve(ReserveVO vo) {
		return mybatis.delete("ReserveDAO.delReserve", vo);
	}
	
	public int updateReserve(ReserveVO vo) {
		return mybatis.update("ReserveDAO.updateReserve", vo);
	}
	
	public UserVO selReserveUser(String id) {
		return mybatis.selectOne("ReserveDAO.selReserveUser",id);
	}
	
	// 예약목록 수정
	public List<ReserveVO> modifyReserve (ReserveVO vo) {
		return mybatis.selectList("ReserveDAO.modifyReserve", vo);
	}
	
	// 예약목록 삭제
	public void modiDeleReserve (ReserveVO vo) {
	mybatis.delete("ReserveVO.modideleReserve", vo);
	}
	
	// 예약목록 전체 페이지 수 조회
	public int countReserve(ReserveVO vo) {
		return mybatis.selectOne("ReserveDAO.countReserve", vo);
	}

	// 비공개 수정
	public void upReserve(ReserveVO vo) {
		mybatis.update("ReserveDAO.upReserve", vo);
	}
	
	public List<ReserveVO> getFiveReserveList() {
		return mybatis.selectList("ReserveDAO.getReserveList");
	}
	
}
