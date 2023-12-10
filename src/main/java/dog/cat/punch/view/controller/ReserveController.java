package dog.cat.punch.view.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dog.cat.punch.reserve.ReserveService;
import dog.cat.punch.reserve.ReserveVO;
import dog.cat.punch.review.ReviewVO;
import dog.cat.punch.user.UserService;
import dog.cat.punch.util.PagingVO;

@Controller
public class ReserveController {
	
	@Autowired
	private ReserveService reserveService;
	
	
	@RequestMapping("/dogcatDelLuna.rsv")
	public String dogcatDelLuna() {
		return "reserve/u_hotelInfo";
	}
	
	@RequestMapping("/reservePage.rsv")
	public String reserveDelLuna(HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		model.addAttribute("reserveUser", reserveService.selReserveUser(userId));
		return "reserve/u_hotelReservation";
	}
	
	// 예약등록
	@RequestMapping(value = "/insertReserve.rsv", method = RequestMethod.POST)
	public String insertReserve(HttpServletRequest request, ReserveVO vo, HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		
		if(userId == null) {
			return "redirect:/login.do";
		}
		
		vo.setId(userId);
		reserveService.insertReserve(vo);
		reserveService.selReserve(userId);
		return "redirect:getMyReserve.rev";
	}
	
	@RequestMapping("/getMyReserve.rev")
	public String getMyReserve(HttpServletRequest req, ReserveVO vo, HttpSession session, Model model) {
		String userId = (String) session.getAttribute("userId");
		
		model.addAttribute("reservationList", reserveService.selReserve(userId));
		System.out.println("타나요????");
		System.out.println("userId :" + userId);
		
		return "reserve/u_myReserve";
	}
	
	   // 예약관리 목록 나오게하기
//	   @RequestMapping("/a_modifyReserve.rsv")
//	   public String modifyReserve(PagingVO pv, ReserveVO vo, Model model, HttpSession session,
//	         @RequestParam(value = "nowPage", required = false) String nowPage) {
//		   
//	      System.out.println("글 목록 검색 처리");
//	      String cntPerPage = "10";
//
//	      int total = reserveService.countReserve(vo);
//	      System.out.println("cntPerPage :" + cntPerPage);
//	      System.out.println("vo :" + vo);
//	      System.out.println("토탈 :" + total);
//	      if (nowPage == null) {
//	         nowPage = "1";
//	      }
//	      System.out.println("안녕하새우1");
//	      pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
//	      model.addAttribute("paging", pv);
//	      vo.setStart(pv.getStart());
//	      vo.setListcnt(Integer.parseInt(cntPerPage));
//	      System.out.println("리스트 : " + vo.getListcnt()+"스타트 : "+ vo.getStart());
//
//	      String userId = (String) session.getAttribute("userId");
//	      model.addAttribute("reservationList", reserveService.selReserve(userId));
//	      System.out.println("vo :" + vo);
//	      return "reserve/a_modifyReserve";
//	   }

	   @RequestMapping("/a_modifyReserve.rsv")
	   public String modifyReserve(PagingVO pv, ReserveVO vo, Model model, HttpSession session,
	         @RequestParam(value = "nowPage", required = false) String nowPage) {
		   
	      System.out.println("글 목록 검색 처리");
	      String cntPerPage = "10";

	      int total = reserveService.countReserve(vo);
	      System.out.println("cntPerPage :" + cntPerPage);
	      System.out.println("vo :" + vo);
	      System.out.println("토탈 :" + total);
	      if (nowPage == null) {
	         nowPage = "1";
	      }
	      System.out.println("안녕하새우1");
	      pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
	      model.addAttribute("paging", pv);
	      vo.setStart(pv.getStart());
	      vo.setListcnt(Integer.parseInt(cntPerPage));
	      System.out.println("리스트 : " + vo.getListcnt()+"스타트 : "+ vo.getStart());
	      model.addAttribute("reservationList", reserveService.modifyReserve(vo));
	      System.out.println("vo :" + vo);
	      return "reserve/a_modifyReserve";
	   }
	    	
	   
	   // 예약관리 수정할 시
	   @RequestMapping("/upReserve.rsv")
	   public String upReserve(ReserveVO vo, Model model, HttpSession session) {
		  String userId = (String) session.getAttribute("userId");
		  model.addAttribute("reservationList", reserveService.selReserve(userId));
		  System.out.println("여기까진 됨?");
		  reserveService.selReserve(userId);
		  System.out.println("여기는?");
	      reserveService.upReserve(vo);
	       vo.setReserve_YN(userId);
	       System.out.println("userId :" + userId);
	      System.out.println("여기는 예약 수정 controller");
	      System.out.println("하이드처리확인: " + vo.getReserve_YN());
	      // model.addAttribute("hide", vo);
	      return "redirect:a_modifyReserve.rsv";
	   }

//	   @RequestMapping("/upReserve.rsv")
//	   public String upReserve(@RequestParam String reserve_no, @RequestParam String reserve_YN, Model model) {
//	       // 예약 업데이트 로직을 여기에 추가하세요
//	       ReserveVO vo = new ReserveVO();
////	       vo.setReserve_no(reserve_no);
//	       vo.setReserve_YN(reserve_YN);
//	       System.out.println("reserve_YN :" + reserve_YN);
//	       
//	       // 예약 업데이트 서비스 메서드 호출
//	       reserveService.upReserve(vo);
//
//	       // 업데이트 후 다시 목록을 보여주는 로직
//	       // 예를 들어, 다시 목록을 불러오는 메서드를 호출하거나 다른 작업을 수행할 수 있습니다.
//
//	       return "redirect:a_modifyReserve.rsv";
//	   }
	   
	   // 예약관리 삭제
	   @RequestMapping("/deleteReserve.rsv")
	   public String deleteReserve(ReserveVO vo, HttpServletRequest request, HttpSession session, Model model) {
			  String userId = (String) session.getAttribute("userId");
		      model.addAttribute("reservationList", reserveService.selReserve(userId));
			System.out.println("여기는 삭제관련 controller");
	      reserveService.deleteReserve(vo);
	      return "redirect:a_modifyReserve.rsv";
	   }
}
