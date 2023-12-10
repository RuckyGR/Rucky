package dog.cat.punch.view.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dog.cat.punch.order.OrderDTO;
import dog.cat.punch.order.OrderService;
import dog.cat.punch.products.LikeVO;
import dog.cat.punch.products.ProductsService;
import dog.cat.punch.qna.QnaService;
import dog.cat.punch.qna.QnaVO;
import dog.cat.punch.reserve.ReserveService;
import dog.cat.punch.review.ReviewService;
import dog.cat.punch.review.ReviewVO;
import dog.cat.punch.user.UserService;
import dog.cat.punch.user.UserVO;

@Controller
public class TotalController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private ReserveService reserveService;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private UserService userService;

	@Autowired
	private QnaService qnaService;
	
	@Autowired
	private ProductsService productsService;

	@RequestMapping("/adminMain.tot")
	public String adminMain(Model model) {
		QnaVO qnaVO = new QnaVO();
		UserVO userVO = new UserVO();
		OrderDTO orderDTO = new OrderDTO();
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setListcnt(5);
		orderDTO.setListcnt(5);
		userVO.setListcnt(5);
		qnaVO.setListcnt(5);
		model.addAttribute("orderList",orderService.getOrderList(orderDTO));
		model.addAttribute("userList",userService.getUserList(userVO));
		model.addAttribute("qnaList",qnaService.getQnaList(qnaVO));
		model.addAttribute("reserveList",reserveService.getFiveReserveList());
		model.addAttribute("declarationList", reviewService.declarationList(reviewVO));
		
		return "admin/a_main";
	}

	@RequestMapping("/Main.tot")
	public String Main() {
		return "redirect:dogcat_main.jsp";
	}

	@RequestMapping("/myPage.tot")
	public String myPage(UserVO vo, HttpSession session, Model model) {
		QnaVO qnaVO = new QnaVO();
		LikeVO likeVO = new LikeVO(); 
		OrderDTO odDTO = new OrderDTO();
		String id=(String)session.getAttribute("userId");
		
		vo.setId(id);
		odDTO.setSearchCondition("ID");
		odDTO.setSearchKeyword(id);
		odDTO.setListcnt(5);
		likeVO.setId(id);
		qnaVO.setId(id);
		qnaVO.setListcnt(5);
		List<LikeVO> likeList = productsService.likeMyList(id);
		List<QnaVO> qnaList = qnaService.myQnaList(qnaVO);
		
		model.addAttribute("orderList", orderService.getOrderList(odDTO));
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("likeList", likeList);
		model.addAttribute("user", userService.petInfo(vo));
		return "user/u_myPage";
	}

	@RequestMapping("/adminProductInsert.tot")
	public String adminProductInsert() {
		return "products/a_productInsert";
	}

}
