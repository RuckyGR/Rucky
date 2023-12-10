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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import dog.cat.punch.order.OrderItemDTO;
import dog.cat.punch.order.OrderService;
import dog.cat.punch.review.ReviewService;
import dog.cat.punch.review.ReviewVO;
import dog.cat.punch.util.PagingVO;

@Controller
public class ReviewController {

	int cntChk = 0;
	// 자동 주입
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private OrderService orderService;

	// -----------추가----------//
	String realPath;


	// 글 등록
	@RequestMapping(value = "/insertReview.rev", method = RequestMethod.POST)
	public String insertReview(MultipartHttpServletRequest request, ReviewVO vo)
			throws IllegalStateException, IOException {
		MultipartFile uploadFile = vo.getRev_uploadFile();
		// 상대 경로 추가 시 realPath 추가
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		System.out.println(realPath);

		if (uploadFile != null) {
			if (!uploadFile.isEmpty()) {
				String fileName = uploadFile.getOriginalFilename();
				vo.setRev_filename(fileName);
				uploadFile.transferTo(new File(realPath + fileName));
			}
		}
		System.out.println("날짜가 나오나" + vo);
		reviewService.insertReview(vo);
		return "redirect:getReviewList.rev";
	}

	@RequestMapping(value = "/insertReview.rev", method = RequestMethod.GET)
	public String insertReview(ReviewVO vo,OrderItemDTO odDTO, @RequestParam String od_num, Model model) throws IllegalStateException, IOException {
		odDTO.setOd_num(od_num);
		model.addAttribute("orderList", orderService.getOrderDetail(od_num));
		System.out.println(orderService.getOrderDetail(od_num));
		
		return "review/u_insertReview";
	}


	// 글 수정
	@RequestMapping("/selectReview.rev")
	public String selectReview(ReviewVO vo, Model model) throws IllegalStateException, IOException {
		System.out.println(vo);
		vo = reviewService.selectReview(vo);
		System.out.println("하이드처리확인: " + vo);
		model.addAttribute("review", vo);
		return "review/u_updateReview";
//         return "redirect:u_updateReview.rev?seq=" + vo.getRev_seq();
	}

//      // 상세조회 수정
	@RequestMapping("/u_updateReview.rev")
	public String getaBoard(HttpServletRequest request, @RequestParam(value = "error", required = false) String error,
			ReviewVO vo, HttpSession session, Model model) throws IllegalStateException, IOException {
		// @RequestParam : Command 객체인 VO에 매핑값이 없는 사용자 입력정보는 직접 받아서 처리
		// value = 화면으로부터 전달된 파라미터 이름(jsp의 input의 name속성 값)
		// required = 생략 가능 여부
		System.out.println("1wf :" + vo);
		MultipartFile uploadFile = vo.getRev_uploadFile();
		// 상대 경로 추가 시 realPath 추가
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");

		if (!(uploadFile == null || uploadFile.isEmpty())) {// uploadFile 파일이 있으면
			String fileName = uploadFile.getOriginalFilename(); // 업로드한 파일명을 문자열로 리턴= originalFileName에 원본 파일명을 저장한다.
			vo.setRev_filename(fileName); // 지정해준 파일명을 vo에 담아줌
			uploadFile.transferTo(new File(realPath + fileName)); // 업로드한 파일을 "/resources/img/"에 저장 = 파일을 업로드한다.
		}
		reviewService.u_updateReview(vo);
		ReviewVO mboard = reviewService.getReview(vo);// boardService에 getBoard(vo)를 mboard에 담기
		System.out.println("9999 :" + vo);
		model.addAttribute("review", mboard);// ==request.setAttribute("board", mboard)/board를 mboard로 변경?
		System.out.println("안녕 난 문어" + vo);
//         return "review/u_getReviewList";// /WEB-INF/board/getBoard.jsp   // 이동할 View는 String으로 처리
		return "redirect:getReviewList.rev";
	}

	// 이미지 파일 삭제
	@RequestMapping("/deleteFile.rev")
	@ResponseBody
	public String deleteFile(ReviewVO vo, HttpServletRequest request) {

		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		System.out.println("파일삭제: " + realPath + vo.getRev_filename());
		if (!(vo.getRev_filename() == null || vo.getRev_filename().equals(""))) {
			File f = new File(realPath + vo.getRev_filename());
			f.delete();
			reviewService.updateFilename(vo);
		}
		return "success";
	}

	// 비공개수정
	@RequestMapping("/updateHide.rev")
	public String updateHide(/* @ModelAttribute("review") */ ReviewVO vo, HttpSession session, Model model) {
		reviewService.updateHide(vo);
		System.out.println("하이드처리확인: " + vo.getRep_hide());
		// model.addAttribute("hide", vo);
		return "redirect:a_declarationList.rev";
	}

	// 글 삭제
	@RequestMapping("/deleteReview.rev")
	public String deleteReview(ReviewVO vo, HttpServletRequest request) {
		System.out.println("맹구몽: " + vo);
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/");
		if (vo.getRev_filename() != null) {
			System.out.println("파일삭제: " + realPath + vo.getRev_filename());
			File f = new File(realPath + vo.getRev_filename());
			f.delete();
		}
		reviewService.deleteReview(vo);
		return "redirect:getReviewList.rev";
	}
	//검색 기능
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("품명", "pro_name");
		conditionMap.put("내용", "rev_content");
		System.out.println("될까요?????????" + conditionMap);
		return conditionMap;
	}
	// 글 목록
	@RequestMapping("/getReviewList.rev")
	public String getReviewList(PagingVO pv, ReviewVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		System.out.println("리뷰 목록 검색 처리");
		String cntPerPage = "10";
		
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("pro_name");
		else
			vo.setSearchCondition(vo.getSearchCondition());
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		else
			vo.setSearchKeyword(vo.getSearchKeyword());
		
		int total = reviewService.countReview(vo);
		if (nowPage == null) {
			nowPage = "1";
		}
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		if (vo.getRep_hide() == null || !"Y".equals(vo.getRep_hide())) {
			cntPerPage = "all";
		}

		vo.setStart(pv.getStart());
		vo.setListcnt("all".equals(cntPerPage) ? total : Integer.parseInt(cntPerPage));
		
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("getReviewList", reviewService.getReviewList(vo));
		return "review/u_getReviewList";

	}

	// 내리뷰 상세 조회
	@RequestMapping("/getMyReview.rev")
	public String getMyReview(HttpSession session, ReviewVO vo, Model model, PagingVO pv,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		System.out.println("내 리뷰 목록 검색 처리");
		String cntPerPage = "5";
		System.out.println("cntPerPage 1221 ::::" +cntPerPage);
		if (nowPage == null) {
			nowPage = "1";
		}
		String sessionId = (String) session.getAttribute("userId");
		System.out.println("sessionId::: "+sessionId);
		vo.setRev_writer(sessionId);
		int total = reviewService.countMyReview(vo);

		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));
		System.out.println("515115    " + vo);
		List<ReviewVO> mboard = reviewService.getMyReview(vo);
		model.addAttribute("reviewList", mboard);
		return "review/u_getMyReview";
	}

	// --------------추가---------------//
	// 신고 접수
	@RequestMapping(value = "/insertReport.rev", method = RequestMethod.POST)
	public String insertReport(MultipartHttpServletRequest request, ReviewVO vo)
			throws IllegalStateException, IOException {
		reviewService.insertReport(vo);
		return "redirect:getReviewList.rev";
	}

	@RequestMapping(value = "/insertReport.rev", method = RequestMethod.GET)
	public String insertReport(@ModelAttribute ReviewVO vo) throws IllegalStateException, IOException {
		System.out.println("9999:" + vo.getRev_seq());
		System.out.println("1010:" + vo.getRev_content());
		return "review/u_insertReport";
	}

	// 신고 목록 및 비공개 처리
	@RequestMapping("/a_declarationList.rev")
	public String declarationList(PagingVO pv, ReviewVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		System.out.println("신고 목록 검색 처리");
		String cntPerPage = "10";

		int total = reviewService.countReport(vo);
		System.out.println(total);
		if (nowPage == null) {
			nowPage = "1";
		}
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("declarationList", reviewService.declarationList(vo));
		System.out.println("신고 목록 페이징 처리");
		return "review/a_declarationList";

	}

	// 신고 삭제
	@RequestMapping("/deleteReport.rev")
	public String deleteReport(ReviewVO vo, HttpServletRequest request) {
		System.out.println("000000000000000000000000");
		reviewService.deleteReport(vo);
		return "redirect:a_declarationList.rev";
	}

}