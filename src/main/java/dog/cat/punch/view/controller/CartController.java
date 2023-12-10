package dog.cat.punch.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dog.cat.punch.cart.CartService;
import dog.cat.punch.cart.CartVO;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;

	// 장바구니 추가
		@ResponseBody
		@RequestMapping("/insertCart.cart")
		public String insertCart(CartVO cartVO, HttpSession session, HttpServletRequest req) {
			String uid = (String) session.getAttribute("userId");
			System.out.println("현재시각 12시11분?");
			if (uid == null) {
				return "5";
			}
			cartVO.setId(uid);
			int result = cartService.insertCart(cartVO);
			return result + "";
		}

	// 장바구니 리스트 가져오기
	@RequestMapping("/getCart.cart")
	public ModelAndView getCart(HttpSession session, ModelAndView mav, HttpServletRequest request) throws IOException {
		Map<String, Object> map = new HashMap<>();

		String uid = (String) session.getAttribute("userId");

		if (uid != null) {
			List<CartVO> cartList = cartService.getCart(uid);
			int sumMoney = cartService.sumMoney(uid);
			int fee = sumMoney >= 50000 ? 0 : 5000;

			map.put("sumMoney", sumMoney);
			map.put("fee", fee);
			map.put("cartList", cartList);
			map.put("sum", sumMoney + fee);
			map.put("count", cartList.size());
			System.out.println("짱구@@" + sumMoney);

			mav.setViewName("cart/u_myCart");
			mav.addObject("map", map);
			System.out.println(mav);

			return mav;
		} else {
			return new ModelAndView("user/u_login", "", null);

		}
	}

	@ResponseBody
	@RequestMapping("/cart/{pro_no}/{quantity}/{order_totalp}")
	public Object cartOneInsert(@PathVariable String pro_no, @PathVariable String quantity,
			@PathVariable String order_totalp, CartVO vo, HttpSession session) {
		System.out.println("짱구@@");
		int proNo = Integer.parseInt(pro_no);
		vo.setPro_no(proNo);
		String userId = session.getAttribute("userId").toString();
		vo.setId(userId);

		int amount = Integer.parseInt(quantity);
		int price = Integer.parseInt(order_totalp);

		CartVO inCartPro = cartService.modifyQuantity(vo);

		vo.setQuantity(amount);
		vo.setTotal_price(price);

		cartService.modifyCount(vo);
		System.out.println("상품목록에서 장바구니에 넣고난 후 쇼핑 계속할건지 아니면 장바구니 가볼건지 확인하는 팝업창 띄워야함.");
		Map<String, Object> map = new HashMap<>();

		List<CartVO> cartList = cartService.getCart(userId);
		int sumMoney = cartService.sumMoney(userId);
		int fee = sumMoney >= 50000 ? 0 : 5000;

		map.put("sumMoney", sumMoney);
		map.put("fee", fee);
		map.put("cartList", cartList);
		map.put("sum", sumMoney + fee);
		map.put("count", cartList.size());
		System.out.println("짱구@@" + sumMoney);
		return map;
	}

	// 장바구니 한개삭제
	@RequestMapping("/deleteCart.cart")
	public String deleteCart(@RequestParam int cart_no) {
		System.out.println("cart_no : " + cart_no);
		cartService.deleteCart(cart_no);
		return "redirect:/getCart.cart";
	}

	// 장바구니 체크
	@RequestMapping("/checkCart.cart")
	public String checkCart(CartVO cartVO) {
		return null;
	}

	// 장바구니 전체삭제
	@RequestMapping("/deleteAllCart.cart")
	public String deleteAllCart(HttpSession session) {
		String uid = (String) session.getAttribute("userId");
		if (uid != null) {
			cartService.deleteAllCart(uid);
		}

		return "redirect:getCart.cart";
	}

	// 장바구니 선택삭제
	@ResponseBody
	@RequestMapping(value = "/selectDel.cart")
	public String selectDel(HttpServletRequest req) {
		String[] del = req.getParameterValues("valueArr");
		System.out.println(del);
		int size = del.length;
		for (int i = 0; i < size; i++) {
			cartService.selectDel(del[i]);
		}
		
		return "success";
	}
}
