package dog.cat.punch.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import dog.cat.punch.cart.CartVO;
import dog.cat.punch.order.OrderDTO;
import dog.cat.punch.order.OrderItemDTO;
import dog.cat.punch.order.OrderService;
import dog.cat.punch.user.UserService;
import dog.cat.punch.user.UserVO;
import dog.cat.punch.util.PagingVO;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	// 주문서 작성 페이지 이동
//	@RequestMapping(value="/u_insertOrder.od", method=RequestMethod.POST)
	@RequestMapping(value="/u_insertOrder.od")
	public ModelAndView getOrderItemOne(HttpSession session, ModelAndView mav, OrderDTO opd,HttpServletResponse response, HttpServletRequest request) throws IOException{
		
		Enumeration<String> em  = request.getParameterNames();
		while(em.hasMoreElements()) {
			System.out.print("key: "+ em.nextElement());
		}
		
		
		String uid = (String) session.getAttribute("userId");
		
//		System.out.println("uid : "+ uid);
//		System.out.println("opd.getOrders() : "+ opd.getOrders());
		
		if(uid != null) {
			List<OrderItemDTO> orderItemList = new ArrayList<>();
			OrderDTO orderInfo = new OrderDTO();
			UserVO orderUser = new UserVO();
		
			orderItemList =  orderService.getOrderItem(opd.getOrders());
			orderUser =  orderService.getUserInfo(uid);
	
			int od_totprice = 0;
			int od_delivercost = 0;
			int itemLength = orderItemList.size();
			String od_payname = null;
			
			for(OrderItemDTO ord : orderItemList) { od_totprice += ord.getOd_price(); }
			
			if(od_totprice >= 50000) { od_delivercost = 0; }else { od_delivercost = 5000; }
			
			if(itemLength > 1) { od_payname = orderItemList.get(0).getPro_name() + " 외 " + itemLength + "건";
			}else { od_payname = orderItemList.get(0).getPro_name() ; }
			
			orderInfo.setOd_totprice(od_totprice);
			orderInfo.setOd_delivercost(od_delivercost);
			orderInfo.setOd_payname(od_payname);
//			System.out.println("od_totprice : " + od_totprice + "\n od_delivercost : " + od_delivercost);
			
			mav.addObject("orderItemList", orderItemList);
			mav.addObject("orderUser", orderUser);
			mav.addObject("orderInfo", orderInfo);
			mav.addObject("itemLength", itemLength);
			mav.setViewName("order/u_insertOrder");
			
//			System.out.println("orderItemList : " + orderItemList);
//			System.out.println("memberInfo : " + orderUser);
//			System.out.println("itemLength : " + itemLength);
//			System.out.println("controller return");
			
			return mav;
		} else {
			
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			out.println("<script> alert('로그인이 필요한 서비스입니다.');");
			out.println("location.href='login.do';");
			out.println("</script>"); 
			out.close();
			return new ModelAndView("", "", null);
		}
	}
	
	// 주문목록
	@RequestMapping("/a_listOrder.od")
	public String OrderList(HttpSession session, Model model, ModelAndView mav, PagingVO pv, OrderDTO ord, @RequestParam(value = "nowPage", required = false) String nowPage){
		String uid = (String) session.getAttribute("userId");
		System.out.println("uid : "+ uid);
		
		int total = orderService.countOrder(ord);
		System.out.println("total : " + total);
		if(nowPage == null) { nowPage = "1"; }
		String cntPerPage = "10";
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		ord.setStart(pv.getStart());
		ord.setListcnt(Integer.parseInt(cntPerPage));
		
		model.addAttribute("searchKeyword", ord.getSearchKeyword());
		model.addAttribute("searchKeyword2", ord.getSearchKeyword2());
		model.addAttribute("searchCondition", ord.getSearchCondition());
		
		List<OrderDTO> orderList = orderService.getOrderList(ord);
		System.out.println("orderList : " + orderList);
		model.addAttribute("orderList", orderList);
		model.addAttribute("itemLength", total);
		
		System.out.println("controller return");
		return "order/a_listOrder";
	}
	
	@RequestMapping("/u_listOrder.od")
	public String OrderList(HttpSession session, Model model, PagingVO pv, OrderDTO ord, @RequestParam(value = "nowPage", required = false) String nowPage){
		String uid = (String) session.getAttribute("userId");
		System.out.println("uid : "+ uid);
		ord.setId(uid);
		
		String cntPerPage = "10";
		
		if (ord.getSearchCondition() == null) ord.setSearchCondition("ID");
		else ord.setSearchCondition(ord.getSearchCondition());
		
		if (ord.getSearchKeyword() == null) ord.setSearchKeyword(uid);
		else ord.setSearchKeyword(ord.getSearchKeyword());
		
		if (ord.getSearchKeyword2() == null) ord.setSearchKeyword2("");
		else ord.setSearchKeyword2(ord.getSearchKeyword2());
		
		int total = orderService.countOrder(ord);
		System.out.println("total : " + total);
		if(nowPage == null) {
			nowPage = "1";
		}
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		ord.setStart(pv.getStart());
		ord.setListcnt(Integer.parseInt(cntPerPage));
	
		model.addAttribute("searchKeyword", ord.getSearchKeyword());
		model.addAttribute("searchKeyword2", ord.getSearchKeyword2());
		model.addAttribute("searchCondition", ord.getSearchCondition());
		
		List<OrderDTO> orderList = orderService.getOrderList(ord);
		System.out.println("orderList : " + orderList);
		model.addAttribute("orderList", orderList);
		model.addAttribute("itemLength", total);
		
		System.out.println("controller return");
		if(uid.equals("admin")) {
			return "order/a_listOrder";
		}else {
			return "order/u_listOrder";
		}
	}
	
	// 주문목록 검색 옵션
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap(){
		Map<String, String> conditionMap = new HashMap<String, String>();
		
		// 주문목록
		// 유저
		conditionMap.put("u기간조회", "uMONTH");
		conditionMap.put("u6개월", "uSIX");
		conditionMap.put("u기간선택", "uDATE");
		conditionMap.put("u주문상태", "uDELIVERY");

		// 관리자
		conditionMap.put("기간조회", "MONTH");
		conditionMap.put("6개월", "SIX");
		conditionMap.put("기간선택", "DATE");
		conditionMap.put("주문상태", "DELIVERY");
		conditionMap.put("아이디", "ID");
		conditionMap.put("주문자명", "NAME");
		conditionMap.put("전화번호", "PHONE");
		conditionMap.put("이메일", "EMAIL");
		conditionMap.put("주문번호", "OD_NUM");
		
		// 주문 수정
		conditionMap.put("u_info", "U_INFO");
		conditionMap.put("a_delivery", "A_DELIVERY");
		conditionMap.put("a_info", "A_INFO");
		
		return conditionMap;
	}

	// 주문상세
	@RequestMapping("/detailOrder.od")
	public ModelAndView OrderDetail(@RequestParam(value = "od_num") String od_num, HttpSession session, ModelAndView mav){
		String uid = (String) session.getAttribute("userId");
		System.out.println("uid : " + uid);
		System.out.println("od_num : " + od_num );
		
		OrderDTO orderInfo = orderService.getOrderInfo(od_num);
		List<OrderItemDTO> orderItem =  orderService.getOrderDetail(od_num);
		int itemLength = orderItem.size();
		System.out.println("getOrderInfo : " + orderInfo);
		System.out.println("getOrderInfo : " + orderItem);
		
		mav.addObject("orderInfo", orderInfo);
		mav.addObject("orderItem", orderItem);
		mav.addObject("itemLength", itemLength);
		
		if(uid.equals("admin")) {
			mav.setViewName("order/a_detailOrder");
		}else{
			mav.setViewName("order/u_detailOrder");
		}
		System.out.println("controller return");

		return mav;
	}
	
	// 주문수정
	@ResponseBody
	@RequestMapping(value="/updateOrder.od", method=RequestMethod.POST)
	public int updateOrder(HttpSession session, OrderDTO ord){
		ord.setSearchCondition(ord.getSearchCondition());
//		if (ord.getOd_to_name() == null) ord.setOd_to_name(""); else ord.setOd_to_name(ord.getOd_to_name());
		ord.setOd_num(ord.getOd_num());

		ord.setOd_to_name(ord.getOd_to_name());
		ord.setOd_to_phone(ord.getOd_to_phone());
		ord.setOd_to_email(ord.getOd_to_email());
		ord.setOd_from_name(ord.getOd_from_name());
		ord.setOd_from_phone(ord.getOd_from_phone());
		ord.setOd_from_address(ord.getOd_from_address());
		ord.setOd_from_address2(ord.getOd_from_address2());
		ord.setOd_from_address3(ord.getOd_from_address3());
		ord.setOd_from_message(ord.getOd_from_message());

		ord.setOd_delivery(ord.getOd_delivery());
		
		String uid = (String) session.getAttribute("userId");
		String od_num = ord.getOd_num();
		System.out.println("OrderInfo update controller");
		System.out.println("searchCondition : " + ord.getSearchCondition());
		System.out.println("uid : " + uid);
		System.out.println("od_num : " + od_num);
		System.out.println("OrderDTO : " + ord );
		
		orderService.updateOrder(ord);
		return 1;
	}

	
	// 주문취소
	@RequestMapping("/cancelOrder.od")
	public String cancelOrder(@RequestParam(value = "od_num") String od_num, OrderDTO ord, HttpSession session, Model model){
		String uid = (String) session.getAttribute("userId");
		System.out.println("uid : " + uid);
		System.out.println("od_num : " + od_num );
		
		orderService.cancelOrder(od_num);
		model.addAttribute("od_num", od_num);
		model.addAttribute("uid", uid);
		
		if(uid.equals("admin")) {
			return "redirect:order/a_listOrder";
		}else {
			return "/order/u_cancelSuccess";
		}
	}

}		
