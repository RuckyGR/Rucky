package dog.cat.punch.qna;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QnaDAOMybatis {

	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertQna(QnaVO vo) {
		System.out.println("===>mybatis로 insertQna() 기능처리");
		mybatis.insert("QnaDAO.insertQna", vo);
	}

	// 글수정
	public void updateQna(QnaVO vo) {
		System.out.println("===>mybatis로 updateQna() 기능처리");
		mybatis.update("QnaDAO.updateQna", vo);
	}

	// 글삭제
	public void deleteQna(QnaVO vo) {
		System.out.println("===>mybatis로 deleteQna() 기능처리");
		mybatis.delete("QnaDAO.deleteQna", vo);
	}

	// 글상세 조회
	public QnaVO getQna(QnaVO vo) {
		System.out.println("===>mybatis로 getQna() 기능처리");
		return (QnaVO) mybatis.selectOne("QnaDAO.getQna", vo);
	}

	// 글목록 조회
	public List<QnaVO> getQnaList(QnaVO vo) {
		System.out.println("===>mybatis로 getQnaList() 기능처리");
		System.out.println("77777vo: "+vo);
		return mybatis.selectList("QnaDAO.getQnaList", vo);
	}

	// 전체 페이지 수 조회
	public int countQna(QnaVO vo) {
		return mybatis.selectOne("QnaDAO.countQna", vo);
	}
	public int countMyQna(QnaVO vo) {
		return mybatis.selectOne("QnaDAO.countMyQna", vo);
	}

	// 조회수 카운트
	public void updateCnt(QnaVO vo) {
		System.out.println("===>mybatis로 updateCnt() 기능처리");
		mybatis.update("QnaDAO.updateCnt", vo);
	}

	// 답글하기
	public void updateRepl(QnaVO vo) {
		System.out.println("===>mybatis로 updateRepl() 기능처리");
		mybatis.update("QnaDAO.updateRepl", vo);
	}
	
	// 파일 업로드 
	public int updateFilename(QnaVO vo) {
		System.out.println("===>mybatis로 updateFilename() 기능처리");
		return mybatis.update("QnaDAO.updateFilename", vo);
	}
	
	public String getQnaPass(QnaVO vo) {
		System.out.println("===>mybatis로 getQnaPass() 기능처리");
		return mybatis.selectOne("QnaDAO.getQnaPass", vo);
	} 
	public List<QnaVO> myQnaList(QnaVO vo) {
		System.out.println("===>mybatis로 getQnaPass() 기능처리");
		System.out.println("vo : " + vo);
		return mybatis.selectList("QnaDAO.myQnaList", vo);
	} 
}
