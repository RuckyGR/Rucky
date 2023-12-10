package dog.cat.punch.view.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLDecoder;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dog.cat.punch.board.BoardService;
import dog.cat.punch.board.BoardVO;
import dog.cat.punch.util.PagingVO;

@Controller
@SessionAttributes("board")
public class BoardController {
	int cntChk = 0;

	@Autowired
	private BoardService boardService;

	String realPath; 
	

	// 글목록 검색 옵션
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>(); 
		conditionMap.put("내용", "CONTENT"); 
		conditionMap.put("제목", "TITLE");
		return conditionMap;  
	
	}

	// 글 등록
	@RequestMapping(value = "/a_insertBoard.board", method = RequestMethod.POST)
	public String insertBoard(MultipartHttpServletRequest request, BoardVO vo) throws IllegalStateException, IOException {
		
		MultipartFile uplodFile = vo.getUploadFile();
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		System.out.println("왜안찍힘?");
		if (!(uplodFile == null || uplodFile.isEmpty())) {
			String fileName = uplodFile.getOriginalFilename();
			vo.setFilename(fileName);
			uplodFile.transferTo(new File(realPath + fileName));

		}
		boardService.insertBoard(vo);
		return "redirect:a_getBoardList.board";
	}

	@RequestMapping(value = "/a_insertBoard.board", method = RequestMethod.GET)
	public String insertView() throws IllegalStateException, IOException {
		return "board/a_insertBoard";
	}

	// 글 수정
	@RequestMapping("/updateBoard.board")
	public String updateBoard(MultipartHttpServletRequest request,@ModelAttribute("board") BoardVO vo, HttpSession session) throws IllegalStateException, IOException {
		
		MultipartFile uplodFile = vo.getUploadFile();
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");	
		
		if (!(uplodFile == null || uplodFile.isEmpty())) {
			String fileName = uplodFile.getOriginalFilename();
			vo.setFilename(fileName);
			uplodFile.transferTo(new File(realPath + fileName));

		}
		boardService.updateBoard(vo);
		return "redirect:/a_getBoard.board?no="+vo.getNo();
	}

	// 글 삭제
	@RequestMapping("/deleteBoard.board")
	public String deleteBoard(BoardVO vo, HttpServletRequest request) {

		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		
		if (vo.getFilename() != null) {
			System.out.println("파일삭제: " + realPath + vo.getFilename());
			File f = new File(realPath + vo.getFilename());
			f.delete();
		}
		boardService.deleteBoard(vo);
		return "redirect:a_getBoardList.board";
	}

	// 글 상세 조회
	@RequestMapping("/u_getBoard.board")
	public String getBoard(@RequestParam(value="error", required = false) String error,BoardVO vo, Model model) {
	
		BoardVO mboard = boardService.getBoard(vo);
		if (!(error==null || error.equals(""))) cntChk = 0;
		else if(cntChk <= 0) boardService.updateCnt(mboard);
		else cntChk = 0;
	
		model.addAttribute("board", mboard);
		return "board/u_getBoard";
	}

	// 글 목록
	@RequestMapping("/u_getBoardList.board")
	public String getBoardListPost(PagingVO pv ,BoardVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {

		System.out.println("글 목록 검색 처리");
		String cntPerPage = "10";
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("TITLE");
		else
			vo.setSearchCondition(vo.getSearchCondition());
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		else
			vo.setSearchKeyword(vo.getSearchKeyword());
		
		int total = boardService.countBoard(vo);
		System.out.println("total: "+total);
		if (nowPage == null) {
			nowPage = "1"; 
		}
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		System.out.println(pv);
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
                           
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("boardList", boardService.getBoardList(vo));
		
		return "board/u_getBoardList";

	}


	
	// 글 상세 조회
		@RequestMapping("/a_getBoard.board")
		public String getaBoard(@RequestParam(value="error", required = false) String error,BoardVO vo, Model model) {
			
			BoardVO mboard = boardService.getBoard(vo);
		
			model.addAttribute("board", mboard);
			return "board/a_getBoard";
		}

		// 글 목록
		@RequestMapping("/a_getBoardList.board")
		public String getaBoardListPost(PagingVO pv ,BoardVO vo, Model model, @RequestParam(value = "nowPage", required = false) String nowPage) {

			System.out.println("글 목록 검색 처리");
			String cntPerPage = "10";
			if (vo.getSearchCondition() == null)
				vo.setSearchCondition("TITLE");
			else
				vo.setSearchCondition(vo.getSearchCondition());
			if (vo.getSearchKeyword() == null)
				vo.setSearchKeyword("");
			else
				vo.setSearchKeyword(vo.getSearchKeyword());
			
			int total = boardService.countBoard(vo);
			System.out.println("total: "+total);
			if (nowPage == null) {
				nowPage = "1"; 
			}
			pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println(pv);
			model.addAttribute("paging", pv);
			vo.setStart(pv.getStart());
			vo.setListcnt(Integer.parseInt(cntPerPage));
	                               
			model.addAttribute("searchKeyword", vo.getSearchKeyword());
			model.addAttribute("searchCondition", vo.getSearchCondition());
			model.addAttribute("boardList", boardService.getBoardList(vo));
			return "board/a_getBoardList";

		}

	

	//이미지 파일 삭제 
	@RequestMapping("/deleteFile.board")
	public String deleteFile(BoardVO vo){
	
		System.out.println("deleteFile...."+vo.getFilename());
		File file = null; 
		
		try {
			file = new File("/resources/img/"+URLDecoder.decode(vo.getFilename(),"UTF-8"));
			file.delete();
			
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		
		boardService.updateFilename(vo);
		return "redirect:/a_getBoard.board?no="+vo.getNo();
	}
	
}