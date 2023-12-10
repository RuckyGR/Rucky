package dog.cat.punch.view.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dog.cat.punch.user.UserService;
import dog.cat.punch.user.UserVO;
import dog.cat.punch.util.PagingVO;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

// 카카오, 네이버 로그인
	@RequestMapping(value = "/SocialLogin.do")
	public String socialLogin(HttpSession session) {

		UserVO kv = (UserVO) session.getAttribute("Kuser");
		UserVO nv = (UserVO) session.getAttribute("Nuser");
		UserVO kvo = userService.getUser(kv);
		UserVO nvo = userService.getUser(nv);

		if (kv == null) {
			int idchk = idChk(nv);

			if (idchk == 0) {
				userService.joinSocialUser(nv);
				session.setAttribute("userId", nv.getId());
				session.setAttribute("userName", nv.getName());
			} else if (nvo.getLeave_status().equals("N")) {
				session.setAttribute("userId", nv.getId());
				session.setAttribute("userName", nv.getName());
			} else {
				session.setAttribute("userLeave", "n");
			}
		} else if (nv == null) {
			int idchk = idChk(kv);

			if (idchk == 0) {
				userService.joinSocialUser(kv);
				session.setAttribute("userId", kv.getId());
				session.setAttribute("userName", kv.getName());
			} else if (kvo.getLeave_status().equals("N")) {
				session.setAttribute("userId", kv.getId());
				session.setAttribute("userName", kv.getName());
			} else {
				session.setAttribute("userLeave", "k");
			}
		}
		return "redirect:dogcat_main.jsp";
	}

	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value = "/idChk.do", method = RequestMethod.POST)
	public int idChk(UserVO vo) {
		int result = userService.idChk(vo);
		return result;
	}

	// 회원가입 정보 저장, 중복체크
	@RequestMapping(value = "/u_join.do", method = RequestMethod.POST)
	public String u_info(UserVO vo, HttpSession session) {
		String hashPassword = BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
		vo.setPassword(hashPassword);

		int result = userService.idChk(vo);

		if (result == 1) {
			session.setAttribute("userVO", vo);
			return "user/u_joinForm";
		} else if (result == 0) {
			String phone1 = vo.getPhone1();
			String phone2 = vo.getPhone2();
			String phone3 = vo.getPhone3();
			String phone = phone1 + phone2 + phone3;
			vo.setPhone(phone);
			session.setAttribute("userVO", vo);
		}
		return "user/u_pet_info";
	}

	// 펫 인포, 회원가입
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String anotherController(UserVO uv, HttpSession session) {
		UserVO vo = (UserVO) session.getAttribute("userVO");

		String type = uv.getType();
		String pet_name = uv.getPet_name();
		String pet_birth = uv.getPet_birth();

		vo.setType(type);
		vo.setPet_name(pet_name);
		vo.setPet_birth(pet_birth);

		userService.joinUser(vo);
		return "user/u_login";
	}

// (salt값을 따로 저장하지 않으므로 BCrypt의 메서드를 이용하여 parameter로 받은 평문과 hash값을 비교한다)
	// 로그인 처리
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, RedirectAttributes ra, Model model) {
		UserVO loginUser = userService.getUser(vo);

		if (loginUser != null) { // parameter로 받은 평문과 DB에 저장된 암호화값 비교
			if (BCrypt.checkpw(vo.getPassword(), loginUser.getPassword()) && loginUser.getLeave_status().equals("N")) {
				session.setAttribute("userId", userService.getUser(vo).getId());
				session.setAttribute("userName", userService.getUser(vo).getName());
				session.setAttribute("loginUser", loginUser);
				return "redirect:dogcat_main.jsp";
			} else if (loginUser.getLeave_status().equals("Y")) {
				session.setAttribute("userLeave", "l");
				return "redirect:dogcat_main.jsp";
			}
		}
		// 비밀번호 틀릴 경우
		model.addAttribute("error", 1);
		ra.addFlashAttribute("resultMsg", "아이디 또는 비밀번호가 올바르지 않습니다.");
		return "user/u_login";
	}

	// 마이페이지, 유저상세보기
	@RequestMapping("/selUser.do")
	public String selUser(UserVO vo, Model model, HttpSession session) {
		model.addAttribute("user", userService.selUser(vo));
		if (session.getAttribute("userId").equals("admin")) {
			return "user/a_selUser";
		}
		System.out.println("마이페이지눌렀을때: " + vo);

		return "user/u_selUser";
	}

	@RequestMapping(value = "/chgPw.do", method = RequestMethod.POST)
	public String changePassword(@RequestParam("currentPassword") String currentPassword,
			@RequestParam("password1") String newPassword, HttpSession session, RedirectAttributes ra) {
		UserVO vo = (UserVO) session.getAttribute("loginUser");
		System.out.println("비번변경: " + vo);

		if (vo != null) {
			if (BCrypt.checkpw(currentPassword, vo.getPassword())) {
				String hashNewPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

				vo.setPassword1(hashNewPassword);

				userService.updatePw(vo);

				session.setAttribute("loginUser", vo);

				return "redirect:selUser.do?id=" + vo.getId();
			} else {
				ra.addFlashAttribute("errorMessage", "현재 비밀번호가 올바르지 않습니다.");
			}
		} else {
			ra.addFlashAttribute("errorMessage", "로그인 정보를 찾을 수 없습니다.");
		}

		return "user/u_chgPw";
	}

	// 회원정보 수정
	@RequestMapping("/updateUser.do")
	public String updateUser(UserVO vo, HttpSession session) {

		String hashPassword = BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
		vo.setPassword(hashPassword);

		session.setAttribute("userName", vo.getName());
		if (session.getAttribute("userId").equals("admin")) {
			userService.a_updateUser(vo);
		} else {
			userService.u_updateUser(vo);
		}
		return "redirect:selUser.do?id=" + vo.getId();
	}

	@RequestMapping("/goChgPw.do")
	public String goChgPw(UserVO vo, Model model) {
		userService.selUser(vo);
		return "user/u_chgPw";
	}

	// 회원가입 jsp 이동
	@RequestMapping("/joinForm.do")
	public String joinForm(UserVO vo) {
		return "user/u_joinForm";
	}

	// 회원탈퇴
	@RequestMapping("/delUser.do")
	public String delUser(UserVO vo, HttpSession session) {
		vo.setLeave_status("Y");
		userService.updateLeave(vo);
		if (session.getAttribute("userId").equals("admin")) {
			return "redirect:userList.do";
		}
		session.invalidate();
		return "redirect:dogcat_main.jsp";
	}

	// 회원목록 페이징처리
	@RequestMapping("/userList.do")
	public String getUserList(PagingVO pv, UserVO vo, Model model,
			@RequestParam(value = "nowPage", required = false) String nowPage) {
		System.out.println("글 목록 검색 처리");
		String cntPerPage = "10"; // 보여질 게시물 갯수
		if (vo.getSearchCondition() == null)
			vo.setSearchCondition("NAME");
		else
			vo.setSearchCondition(vo.getSearchCondition());
		if (vo.getSearchKeyword() == null)
			vo.setSearchKeyword("");
		else
			vo.setSearchKeyword(vo.getSearchKeyword());

		int total = userService.countUser(vo);
		if (nowPage == null) {
			nowPage = "1";
		}
		pv = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pv);
		vo.setStart(pv.getStart());
		vo.setListcnt(Integer.parseInt(cntPerPage));

		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("userList", userService.getUserList(vo));
		return "user/a_userList";
	}

	// 회원목록 검색 옵션
	@ModelAttribute("conditionMap")
	public Map<String, String> searchConditionMap() {
		Map<String, String> conditionMap = new HashMap<String, String>();
		conditionMap.put("아이디", "ID");
		conditionMap.put("이름", "NAME");
		return conditionMap;
	}

	@GetMapping(value = "/login.do")
	public String loginView(UserVO vo) {
		return "user/u_login";
	}

	// 문자인증보내기
	@RequestMapping("/sendSMS.do")
	@ResponseBody
	public String sendSMS(String phoneNumber) {

		Random rand = new Random(); 
		String numStr = "";
		for (int i = 0; i < 4; i++) {
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}

		userService.certifiedPhoneNumber(phoneNumber, numStr); // 휴대폰 api 쪽으로 가기 !!
		// // 밑에 자세한 설명나옴

		return numStr;
	}

	// 이메일 비번재발급
	@RequestMapping(value = "/findPwView.do")
	public String findPwView(HttpSession session) throws Exception {
		session.setAttribute("pw_st", "y");
		return "user/u_findPwView";
	}

	// 비번찾기
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public String findPw(UserVO vo, Model model, HttpSession session) throws Exception {
		// logger.info("memberPw"+vo.getMemberId());
		System.out.println("memberPw" + vo.getId());
		if (userService.findPwCheck(vo) == 0) {
			session.setAttribute("pw_st", "n");
			return "user/u_findPwView";
		} else {

			userService.findPw(vo.getEmail(), vo.getId());
			model.addAttribute("email", vo.getEmail());

			return "user/u_findPw";
		}
	}

	// 아이디확인창 이동
	@RequestMapping(value = "/findIdView.do")
	public String findIdView(HttpSession session) throws Exception {
		session.setAttribute("id_st", "y");
		return "user/u_findIdView";
	}

	// 아이디 확인하는 컨트롤러
	@RequestMapping("/findId.do")
	public String emailConfirm(UserVO vo, Model model, String mail, HttpSession session) throws Exception {
		System.out.println("탔다 ㅁㄴㅇㅁㄴㅇ : " + vo);
		model.addAttribute("email", vo.getEmail());
		
		int idct = userService.findId(vo);
		if(idct == 0) {
			session.setAttribute("id_st", "n");
			return "user/u_findIdView";
		}else {
			return "user/u_findIdMail";
		}
	}

	// 이메일에서 확인 눌렀을 때
	@RequestMapping(value = "/confirmEmail")
	public String checkId(UserVO vo, Model model, HttpSession session) throws Exception {

		List<UserVO> lv = userService.checkId(vo);
		System.out.println("체크아이디에서 가져온거::::  " + lv);
		
		if (lv == null) {
			session.setAttribute("id_st", "n");
			return "user/u_findIdView";
		} else {
			model.addAttribute("id", lv);
			return "/user/u_findId";
		}
	}

	// 로그아웃
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:dogcat_main.jsp";
	}
}