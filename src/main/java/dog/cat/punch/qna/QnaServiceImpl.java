package dog.cat.punch.qna;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("qnaService")
public class QnaServiceImpl implements QnaService {

	@Autowired
	private QnaDAOMybatis qnaDAO;
	
	@Override
	public void insertQna(QnaVO vo) {
		qnaDAO.insertQna(vo);
	}

	@Override
	public void updateQna(QnaVO vo) {
		qnaDAO.updateQna(vo);
	}

	@Override
	public void deleteQna(QnaVO vo) {
		qnaDAO.deleteQna(vo);		
	}

	@Override
	public QnaVO getQna(QnaVO vo) {
		return qnaDAO.getQna(vo);
	}

	@Override
	public List<QnaVO> getQnaList(QnaVO vo) {
		return qnaDAO.getQnaList(vo);
	}

	@Override
	public int countQna(QnaVO vo) {
		return qnaDAO.countQna(vo);
	}

	@Override
	public void updateCnt(QnaVO vo) {
		qnaDAO.updateCnt(vo);
	}

	@Override
	public void updateRepl(QnaVO vo) {
		qnaDAO.updateRepl(vo);
	}

	@Override
	public int updateFilename(QnaVO vo) {
		return qnaDAO.updateFilename(vo);
	}

	@Override
	public String getQnaPass(QnaVO vo) {
		return qnaDAO.getQnaPass(vo);
	}

	@Override
	public List<QnaVO> myQnaList(QnaVO vo) {
		return qnaDAO.myQnaList(vo);
	}

	@Override
	public int countMyQna(QnaVO vo) {
		return qnaDAO.countMyQna(vo);
	}
}
