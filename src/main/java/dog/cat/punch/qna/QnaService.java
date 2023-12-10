package dog.cat.punch.qna;

import java.util.List;

public interface QnaService {
		
	void insertQna(QnaVO vo);
	
	void updateQna(QnaVO vo);
	
	void deleteQna(QnaVO vo);
	
	QnaVO getQna(QnaVO vo);
	
	List<QnaVO> getQnaList(QnaVO vo);
	
	public int countQna (QnaVO vo);
	public int countMyQna (QnaVO vo);
	
	void updateCnt(QnaVO vo);

	void updateRepl(QnaVO vo);                                                                                                        
	
	int updateFilename(QnaVO vo);

	String getQnaPass(QnaVO vo);
	
	List<QnaVO> myQnaList(QnaVO vo);
}
