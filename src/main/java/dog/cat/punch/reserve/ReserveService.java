package dog.cat.punch.reserve;

import java.util.List;

import dog.cat.punch.user.UserVO;

public interface ReserveService {
	
	void insertReserve(ReserveVO vo);
	
	List<ReserveVO> selReserve(String id);
	
	void deleteReserve(ReserveVO vo);
	
	void updateReserve(ReserveVO vo);
	
	UserVO selReserveUser(String id);
	
	//예약 리스트
	List<ReserveVO> modifyReserve(ReserveVO vo);
	
	//예약 삭제
	void modiDeleReserve(ReserveVO vo);

	//예약 총 갯수
	public int countReserve(ReserveVO vo);

	//예약 유무
	void upReserve (ReserveVO vo);
	
	List<ReserveVO> getFiveReserveList();
}
