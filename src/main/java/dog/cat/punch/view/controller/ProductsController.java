package dog.cat.punch.view.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import dog.cat.punch.products.LikeVO;
import dog.cat.punch.products.ProductsService;
import dog.cat.punch.products.ProductsVO;
import dog.cat.punch.review.ReviewService;
import dog.cat.punch.review.ReviewVO;
import dog.cat.punch.util.PagingVO;

@Controller
@SessionAttributes("pro")
public class ProductsController {
	int cntChk = 0;
	@Autowired
	ProductsService productsService;

	@Autowired
	ReviewService reviewService;

	String realPath;

	@ModelAttribute("cookieMap")
	Map<String, List<ProductsVO>> cookieMap(HttpServletRequest req) {
		Cookie cookie = WebUtils.getCookie(req, "proNo");
		ArrayList<Integer> noArr = null;

		if (cookie != null) {
			noArr = new ArrayList<>();
			String[] prr = cookie.getValue().split("_");

			for (String b : prr) {
				noArr.add(Integer.parseInt(b));
			}
		}

		List<ProductsVO> cList = productsService.cookieList(noArr);

		int maxRecentProducts = 5;
		if (cList != null && cList.size() > maxRecentProducts) {
			cList = cList.subList(0, maxRecentProducts);
		}

		Map<String, List<ProductsVO>> cookieList = new HashMap<>();
		cookieList.put("cookieList", cList);

		return cookieList;
	}

	public void setCookies(HttpServletResponse res, HttpServletRequest req, String no) {
		Cookie cookie = WebUtils.getCookie(req, "proNo");

		if (cookie == null) {
			cookie = new Cookie("proNo", no);
		} else {
			Set<String> uniqueNumbers = new HashSet<>(Arrays.asList(cookie.getValue().split("_")));
			uniqueNumbers.add(no);

			List<String> limitedNumbers = new ArrayList<>(uniqueNumbers);
			int maxRecentProducts = 5;
			if (limitedNumbers.size() > maxRecentProducts) {
				limitedNumbers = limitedNumbers.subList(0, maxRecentProducts);
			}

			// 중복 제거 및 제한된 개수의 상품 번호를 다시 쿠키 값으로 설정
			cookie = new Cookie("proNo", String.join("_", limitedNumbers));
		}

		cookie.setPath("/");
		cookie.setMaxAge(1 * 60 * 60 * 24);
		res.addCookie(cookie);
	}

	@PostMapping("/removeProduct")
	@ResponseBody
	public String removeProduct(@RequestBody String proNo, HttpServletRequest request, HttpServletResponse response) {
		String cookieName = "proNo";
		Cookie[] cookies = request.getCookies();

		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals(cookieName)) {
					String[] values = cookie.getValue().split("_");
					StringBuilder updatedValue = new StringBuilder();
					for (String value : values) {
						if (!value.equals(proNo)) {
							if (updatedValue.length() > 0) {
								updatedValue.append("_");
							}
							updatedValue.append(value);
						}
					}

					cookie.setValue(updatedValue.toString());
					cookie.setMaxAge(0);
					response.addCookie(cookie);
					return "success";
				}
			}
		}

		return "fail";
	}

	@RequestMapping("/getproducts.pro")
	public String getProducts(@RequestParam int pro_no,
			@RequestParam(value = "pro_name", required = false) String pro_name, Model model, ProductsVO vo,
			HttpServletRequest request, HttpServletResponse response) {

		setCookies(response, request, String.valueOf(pro_no));

		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");

		LikeVO like = new LikeVO();
		like.setId(userId);
		like.setPro_no(pro_no);

		LikeVO userLike = productsService.bringLike(like);

		if (userLike != null) {
		} else {
			userLike = new LikeVO();
			like.setLike_check(0);
		}
		model.addAttribute("like", userLike);

		session.setAttribute("prodId", pro_no);
		session.setAttribute("prodName", pro_name);

		vo = productsService.getProducts(vo);
		model.addAttribute("Products", vo);
		
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setPro_name(pro_name);
		reviewVO.setListcnt(4);
		System.out.println(reviewService.getReviewProduct(reviewVO));
		model.addAttribute("reviewList", reviewService.getReviewProduct(reviewVO));

		return "products/u_product_detail";
	}

	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("번호", "pro_no");
		conditionMap.put("품명", "pro_name");
		return conditionMap;
	}

	@RequestMapping("/getproductsList.pro")
	public String getProductsList(PagingVO pv, ProductsVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		String cntPerPage = "10";

		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("pro_name");
		else
			vo.setSearchCondition(vo.getSearchCondition());
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		else
			vo.setSearchKeyword(vo.getSearchKeyword());

		int total = productsService.countPro(vo);
		if (nowPage == null) {
			nowPage = "1";

		}
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("ProductsList", productsService.getProductsList(vo));

		return "products/a_productList";
	}

	@RequestMapping(value = "/insertProducts.pro", method = RequestMethod.POST)
	public String insertProducts(MultipartHttpServletRequest request, ProductsVO vo)
			throws IllegalStateException, IOException {
		MultipartFile uploadFile = vo.getUploadFile();

		realPath = request.getSession().getServletContext().getRealPath("/resources/img/productimg/");
		if (uploadFile != null) {
			if (!uploadFile.isEmpty()) {
				String fileName = uploadFile.getOriginalFilename();
				vo.setPro_filename(fileName);
				uploadFile.transferTo(new File(realPath + fileName));
			}
		}
		productsService.insertProducts(vo);
		return "redirect:getproductsList.pro";
	}

	@RequestMapping("/deleteProducts.pro")
	public String deleteProducts(ProductsVO vo, HttpSession session) {
		productsService.deleteProducts(vo);
		return "redirect:/getproductsList.pro";

	}

	@RequestMapping("/u_productsList.pro")
	public ModelAndView userProductsList(PagingVO pv, ProductsVO vo, ModelAndView mav, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		String cntPerPage = "9";
		Map<String, Object> map = new HashMap<>();
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("pro_name");
		else
			vo.setSearchCondition(vo.getSearchCondition());
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		else
			vo.setSearchKeyword(vo.getSearchKeyword());
		int total = productsService.countType(vo);
		if (nowPage == null) {
			nowPage = "1";
		}
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("paging", pv);
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("uProductsList", productsService.userProductsList(vo));
		map.put("proType", vo.getPro_type());

		mav.setViewName("products/u_product_list");
		mav.addObject("map", map);

		return mav;
	}

	@RequestMapping("/headerSearch.pro")
	public ModelAndView headerSearch(PagingVO pv, ProductsVO vo, ModelAndView mav, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		String cntPerPage = "9";
		Map<String, Object> map = new HashMap<>();
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		else
			vo.setSearchKeyword(vo.getSearchKeyword());

		int total = productsService.countPro(vo);
		if (nowPage == null) {
			nowPage = "1";
		}

		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("paging", pv);
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("uProductsList", productsService.headerSearch(vo));

		mav.setViewName("products/u_product_list");
		mav.addObject("map", map);

		return mav;
	}

	@RequestMapping("/updateProducts.pro")
	public String updateBoard(MultipartHttpServletRequest request, ProductsVO vo, HttpSession session)
			throws IllegalStateException, IOException {

		MultipartFile uplodFile = vo.getUploadFile();
		realPath = request.getSession().getServletContext().getRealPath("/resources/img/productimg/");

		if (!(uplodFile == null || uplodFile.isEmpty())) {
			String fileName = uplodFile.getOriginalFilename();
			vo.setPro_filename(fileName);
			uplodFile.transferTo(new File(realPath + fileName));

		}
		productsService.updateProducts(vo);
		return "redirect:getproductsList.pro";
	}

	@RequestMapping("/deleteFile.pro")
	@ResponseBody
	public String deleteFile(ProductsVO vo, HttpServletRequest request) {

		realPath = request.getSession().getServletContext().getRealPath("/resources/img/productimg/");
		if (!(vo.getPro_filename() == null || vo.getPro_filename().equals(""))) {
			File f = new File(realPath + vo.getPro_filename());
			f.delete();
			productsService.updateFilename(vo);
		}
		return "success";
	}

	@RequestMapping(value = "/download.pro", method = RequestMethod.GET)
	public void fileDownLoad(@RequestParam(value = "filename", required = false) String filename,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (filename == null || filename.equals("")) {
		} else {

			realPath = request.getSession().getServletContext().getRealPath("/resources/img/productimg/");
			File file = new File(realPath + filename);

			String fn = new String(file.getName().getBytes(), "iso_8859_1");

			byte[] bytes = org.springframework.util.FileCopyUtils.copyToByteArray(file);
			response.setHeader("Content-Disposition", "attachment; filename=\"" + fn + "\"");
			response.setContentLength(bytes.length);

			response.getOutputStream().write(bytes);
			response.getOutputStream().flush();
			response.getOutputStream().close();
		}
	}

	@RequestMapping("/a_getProducts.pro")
	public String getProducts(@RequestParam(value = "error", required = false) String error, ProductsVO vo,
			Model model) {
		ProductsVO mProducts = productsService.getProducts(vo);

		if (!(error == null || error.equals("")))
			mProducts = productsService.getProducts(vo);
		model.addAttribute("Products", mProducts);
		return "products/a_productInform";
	}

	@ResponseBody
	@RequestMapping(value = "/like.pro", method = RequestMethod.GET)
	public int likePOST(ProductsVO pvo, HttpSession session, Model model) {

		int result = -1;
		String userId = (String) session.getAttribute("userId");
		if (userId == null) {
			return result;
		}

		LikeVO vo = new LikeVO();
		vo.setId(userId);
		vo.setPro_no(pvo.getPro_no());
		
		result = productsService.checkLike(vo);
		System.out.println(result);
		session.setAttribute("result", result);

		return result;
	}

	@RequestMapping(value = "/getLikeList.pro")
	public ModelAndView getLike(HttpSession session, ModelAndView mav, LikeVO like) {
		Map<String, Object> map = new HashMap<>();

		String userId = (String) session.getAttribute("userId");

		if (userId != null) {
			List<LikeVO> likeList = productsService.likeList(userId);

			map.put("likeList", likeList);
			map.put("count", likeList.size());

			mav.setViewName("products/u_likeList");
			mav.addObject("map", map);

			return mav;
		} else {
			return new ModelAndView("user/u_login", "", null);
		}
	}

	@RequestMapping("/deletelike.pro")
	public String deleteLike(@RequestParam int like_pro_no, LikeVO vo, HttpSession session) {
		vo.setLike_pro_no(like_pro_no);
		productsService.deleteLike(vo);
		return "redirect:/getLikeList.pro";

	}

	@ResponseBody
	@RequestMapping(value = "/selectDelLike.pro")
	public String selectDel(HttpServletRequest req) {
		String[] del = req.getParameterValues("valueArr");
		int size = del.length;
		for (int i = 0; i < size; i++) {
			productsService.selectDelLike(del[i]);
		}

		return "success";
	}

	@RequestMapping(value = "/Main.pro")
	public String goMain(ProductsVO vo, Model model) {
		List<ProductsVO> product = productsService.bestItem();
		model.addAttribute("product", product);

		return "products/bestItem";

	}

}
