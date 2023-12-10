package dog.cat.punch.reserve;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dog.cat.punch.review.ReviewVO;
import dog.cat.punch.user.UserVO;

@Service("reserveService")
public class ReserveServiceImpl implements ReserveService{
	
	
	@Autowired
	private ReserveDAO reserveDAO;
	
	@Override
	public void insertReserve(ReserveVO vo) {
		reserveDAO.insertReserve(vo);
	}

	@Override
	public List<ReserveVO> selReserve(String id) {
		return reserveDAO.selReserve(id);
	}

	@Override
	public void deleteReserve(ReserveVO vo) {
		reserveDAO.deleteReserve(vo);
	}

	@Override
	public void updateReserve(ReserveVO vo) {
		reserveDAO.updateReserve(vo);
	}

	@Override
	public UserVO selReserveUser(String id) {
		return reserveDAO.selReserveUser(id);
	}


	@Override
	public List<ReserveVO> modifyReserve(ReserveVO vo) {
		return reserveDAO.modifyReserve(vo);
	}
	
	@Override
	public void modiDeleReserve(ReserveVO vo) {
		reserveDAO.modiDeleReserve(vo);
	}

	@Override
	public int countReserve(ReserveVO vo) {
		return reserveDAO.countReserve(vo);
	}

	@Override
	public void upReserve(ReserveVO vo) {
		reserveDAO.upReserve(vo);
	}

	@Override
	public List<ReserveVO> getFiveReserveList() {
		return reserveDAO.getFiveReserveList();
	}

}
