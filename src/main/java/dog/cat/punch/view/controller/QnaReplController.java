package dog.cat.punch.view.controller;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import dog.cat.punch.qna.QnaService;
import dog.cat.punch.qna.QnaVO;
import dog.cat.punch.util.PagingVO;

@Controller
@SessionAttributes("qna")
public class QnaReplController {
	int cntChk = 0;
	
	@Autowired
	private QnaService qnaService;	
	
	String realPath;
	
//	글목록 검색 옵션
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "QNA_TITLE");
		conditionMap.put("내용", "QNA_CONTENT");
		return conditionMap;
	}
// 글 목록 페이징 처리
		@RequestMapping("/a_getQnaList.qna")
		public String getQnaList(PagingVO pv, QnaVO vo, Model model,
				@RequestParam(value = "nowPage", required = false) String nowPage) {
			System.out.println("글 목록 검색 처리");
			String cntPerPage = "10";
			System.out.println("키워드 가쟈오니" + vo.getSearchKeyword());
			if (vo.getSearchCondition() == null)
				vo.setSearchCondition("qna_title");
			else
				vo.setSearchCondition(vo.getSearchCondition());
			if (vo.getSearchKeyword() == null) {
				System.out.println("1111");
				vo.setSearchKeyword("");
			}else {
				vo.setSearchKeyword(vo.getSearchKeyword());
			}
			int total = qnaService.countQna(vo);
			if (nowPage == null) {
				nowPage = "1";
			}
			pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", pv);
			vo.setStart(pv.getStart());
			vo.setListcnt(Integer.parseInt(cntPerPage));

			model.addAttribute("searchKeyword", vo.getSearchKeyword());
			model.addAttribute("searchCondition", vo.getSearchCondition());
			model.addAttribute("qnaList", qnaService.getQnaList(vo));

			return "qna/a_getQnaList";

		}

	// 글 상세 조회
	@RequestMapping("/getQnaRepl.qna")
	public String getQna(@RequestParam(value="error", required = false) String error,QnaVO vo, Model model) {
		System.out.println("관리자 상세조회");
		QnaVO mboard = qnaService.getQna(vo);
		if (!(error==null || error.equals(""))) cntChk = 0;
		else if(cntChk <= 0) qnaService.updateCnt(mboard);
		else cntChk = 0;
		mboard = qnaService.getQna(vo);
		model.addAttribute("qna", mboard);
		return "qna/a_getQna";
	}
	
	// 답변 
	@RequestMapping(value = "/updateRepl.qna", method = RequestMethod.POST)
	public String updateRepl(@ModelAttribute("qna") QnaVO vo, HttpSession session){
	cntChk++;
	System.out.println("작동확인");
	qnaService.updateRepl(vo);
	System.out.println("vo"+vo);
	return "redirect:/a_getQnaList.qna"; 
	}
	
	// 글 삭제
	@RequestMapping("/adeleteQna.qna")
	public String deleteQna(QnaVO vo, HttpServletRequest request) {

		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		if (vo.getQna_filename() != null) {
			System.out.println("파일삭제: " + realPath + vo.getQna_filename());
			File f = new File(realPath + vo.getQna_filename());
			f.delete();
		}
		qnaService.deleteQna(vo);
		return "redirect:a_getQnaList.qna";
	}
	
	
}
