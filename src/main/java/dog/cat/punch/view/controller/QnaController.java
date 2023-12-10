package dog.cat.punch.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dog.cat.punch.qna.QnaService;
import dog.cat.punch.qna.QnaVO;
import dog.cat.punch.util.PagingVO;

@Controller
@SessionAttributes("qna")
public class QnaController {
	int cntChk = 0;

	@Autowired
	private QnaService qnaService;

	String realPath;

	// 글 등록
	@RequestMapping(value = "/insertQna.qna", method = RequestMethod.POST)
	public String insertQna(MultipartHttpServletRequest request, QnaVO vo, HttpSession session) 
			throws IllegalStateException, IOException {
		String ID = (String)session.getAttribute("userId"); 
		vo.setId(ID);
		MultipartFile uploadFile = vo.getQna_uploadFile();

		// 상대 경로 추가 시 realPath 추가
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		
		if (!(uploadFile == null || uploadFile.isEmpty())) {
			String fileName = uploadFile.getOriginalFilename();
			vo.setQna_filename(fileName);
			
			uploadFile.transferTo(new File(realPath + fileName));
		}
		qnaService.insertQna(vo);
		return "redirect:u_getQnaList.qna";
	}

	@RequestMapping(value = "/insertQna.qna", method = RequestMethod.GET)
	public String insertView(QnaVO vo) throws IllegalStateException, IOException {
		return "qna/u_insertQna";
	}

	// 글 수정
	@RequestMapping(value = "/updateQna.qna", method = RequestMethod.POST)
	public String updateQna(MultipartHttpServletRequest request, QnaVO vo,Model model)
	        throws IllegalStateException, IOException {
	    MultipartFile uploadFile = vo.getQna_uploadFile();
	    realPath = request.getSession().getServletContext().getRealPath("/resources/img/");

	    if (uploadFile != null) {
	        if (!uploadFile.isEmpty()) {
	            String fileName = uploadFile.getOriginalFilename();
	            vo.setQna_filename(fileName);
	            uploadFile.transferTo(new File(realPath + fileName));
	            System.out.println("업로드 : " + fileName);
	        }
	    }
		qnaService.updateQna(vo);
		QnaVO mboard = qnaService.getQna(vo);// boardService에 getBoard(vo)를 mboard에 담기
		System.out.println("수정! :" + vo);
		model.addAttribute("qna", mboard);// ==request.setAttribute("board", mboard)/board를 mboard로 변경?
		return "qna/u_getQna";// /WEB-INF/board/getBoard.jsp // 이동할 View는 String으로 처리
	
	}

	// 수정 페이지 이동
	@RequestMapping(value = "/updateQna.qna", method = RequestMethod.GET)
	public String updateView(QnaVO vo) throws IllegalStateException, IOException {
		System.out.println("수정페이지!");
		return "qna/u_updateQna"; 
	}

	// 글 삭제
	@RequestMapping("/deleteQna.qna")
	public String deleteQna(QnaVO vo, HttpServletRequest request) {

		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		if (vo.getQna_filename() != null) {
			System.out.println("파일삭제: " + realPath + vo.getQna_filename());
			File f = new File(realPath + vo.getQna_filename());
			f.delete();
		}
		qnaService.deleteQna(vo);
		return "redirect:u_getQnaList.qna";
	}

	// 글 상세 조회
	@RequestMapping("/getQna.qna")
	public String getQna(@RequestParam(value = "error", required = false) String error, QnaVO vo, Model model) {
		QnaVO mboard = qnaService.getQna(vo);
		if (!(error == null || error.equals("")))
			cntChk = 0;
		else if (cntChk <= 0)
			qnaService.updateCnt(mboard);
		else
			cntChk = 0;
		mboard = qnaService.getQna(vo);
		model.addAttribute("qna", mboard);
		return "qna/u_getQna";
	}

//	글목록 검색 옵션
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("제목", "QNA_TITLE");
		conditionMap.put("내용", "QNA_CONTENT");
		return conditionMap;
	}

	// 글 목록 페이징 처리
	@RequestMapping("/u_getQnaList.qna")
	public String getQnaList(PagingVO pv, QnaVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		System.out.println("글 목록 검색 처리");
		String cntPerPage = "10";
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("qna_title");
		else
			vo.setSearchCondition(vo.getSearchCondition());
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		else
			vo.setSearchKeyword(vo.getSearchKeyword());

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

		return "qna/u_getQnaList";
	}
	
	// 내 질문 목록 
	@RequestMapping("/u_myQnaList.qna")
	public String myQnaList(PagingVO pv, QnaVO vo, Model model, HttpSession session,
	@RequestParam(value = "nowPage", required = false) String nowPage) {
		System.out.println("글 목록 검색 처리");
		
		String ID = (String)session.getAttribute("userId"); 
		vo.setId(ID);
		System.out.println("ID " + ID);
		String cntPerPage = "10";
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("QNA_TITLE");
		else
			vo.setSearchCondition(vo.getSearchCondition());
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		else
			vo.setSearchKeyword(vo.getSearchKeyword());

		int total = qnaService.countMyQna(vo);
		if (nowPage == null) {
			nowPage = "1";
		}
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
		System.out.println("777777nowPage: "+nowPage+", cntPerPage: "+cntPerPage);

		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("searchCondition", vo.getSearchCondition());
		List<QnaVO> lqv = qnaService.myQnaList(vo);
		for(QnaVO v  : lqv) {
			System.out.println("707070 v: "+v);
		}
		model.addAttribute("myQnaList", lqv);

		return "qna/u_myQnaList";
	}

	// 이미지 파일 삭제
	@RequestMapping("/deleteFile.qna")
	@ResponseBody
	public String deleteFilename(QnaVO vo, HttpServletRequest request) {
		
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		System.out.println("파일경로: "+realPath + vo.getQna_filename());
		
		File f = new File(realPath + vo.getQna_filename());
		if (f.delete()) {
			// 파일 삭제 성공
			qnaService.updateFilename(vo);
			return "success"; // 성공적으로 삭제된 경우 "success"를 반환
		} else {
			// 파일 삭제 실패
			return "error"; // 삭제 중 오류가 발생한 경우 "error"를 반환
		}
	}
	
	
	@RequestMapping("/getQnaPass.qna")
	@ResponseBody //ajax 데이터 전송 시 필요
	public String getQnaPass(QnaVO vo) {
		return qnaService.getQnaPass(vo);
	}
	
}
