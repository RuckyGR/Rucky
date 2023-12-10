package dog.cat.punch.view.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import dog.cat.punch.user.UserVO;

@Controller
public class KakaoLoginController {

	public static final String KAKAO_AUTH_URL = "https://kauth.kakao.com/oauth/authorize";
	public static final String KAKAO_TOKEN_URL = "https://kauth.kakao.com/oauth/token";
	public static final String KAKAO_USER_INFO_URL = "https://kapi.kakao.com/v2/user/me";
	public static final String KAKAO_LOGOUT_URL = "https://kapi.kakao.com/v1/user/logout";
	public static final String KAKAO_UNLINK_URL = "https://kapi.kakao.com/v1/user/unlink";
	private static String id;
	public String REDIRECT_URI = "";

	@RequestMapping("/getAuthUrl")
	public String getToken(UserVO vo) {
		REDIRECT_URI = vo.getREDIRECT_URI() + "/getToken";
		String result = KAKAO_AUTH_URL + "?response_type=code&scope=account_email,name,phone_number&client_id="
				+ vo.getREST_API_KEY() + "&redirect_uri=" + REDIRECT_URI;

		return "redirect:" + result;
	}

	@RequestMapping(value = "/getToken")
	public String oauthKakao(UserVO vo, Model model, HttpSession session) throws Exception {
		System.out.println("code777: " + vo.getCode());
		String access_Token = getAccessToken(vo.getCode());

		HashMap<String, Object> userInfo = getUserInfo(access_Token, session);
		System.out.println("access_Token777 : " + access_Token);
		System.out.println("userInfo.access_Token777: " + userInfo.get("access_Token"));
		System.out.println("userInfo777 : " + userInfo.get("email"));
		System.out.println("nickname777 : " + userInfo.get("nickname"));

		model.addAttribute("kakaoInfo", userInfo);

		return "redirect:SocialLogin.do";
	}

	// 카카오 로그아웃
	@RequestMapping(value = "/logout")
	public String logoutKakao(UserVO vo) throws Exception {
		System.out.println("id555: " + id);
		String addURL = "?target_id_type=user_id&target_id=" + id;
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(KAKAO_LOGOUT_URL + addURL);
		get.setHeader("Authorization", "KakaoAK " + vo.getADMIN_KEY());

		HttpResponse res = client.execute(get);
		ObjectMapper mapper = new ObjectMapper();
		String body = EntityUtils.toString(res.getEntity());
		System.out.println("body555: " + body);

		return "redirect:/unlinkKakao";
	}

	// 카카오 계정 끊기
	@RequestMapping(value = "/unlinkKakao")
	public String unlinkKakao(UserVO vo, Model model) {
		System.out.println("id333: " + id);
		String addURL = "?target_id_type=user_id&target_id=" + id;
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(KAKAO_UNLINK_URL + addURL);
		get.setHeader("Authorization", "KakaoAK " + vo.getADMIN_KEY());
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			System.out.println("body333: " + body);

		} catch (Exception e) {
			e.printStackTrace();
		}

		model.addAttribute("kakaoInfo", null);
		return "/home";
	}

	// 토큰발급
	public String getAccessToken(String authorize_code) {
		UserVO vo = new UserVO();
		System.out.println("authorize_code111: " + authorize_code);
		REDIRECT_URI = vo.getREDIRECT_URI() + "/getToken";

		String result = "";
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(KAKAO_TOKEN_URL);
		Map<String, String> m = new HashMap<String, String>();
		m.put("grant_type", "authorization_code");
		m.put("client_id", vo.getREST_API_KEY());
		m.put("redirect_uri", REDIRECT_URI);
		m.put("code", authorize_code);
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);

			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());

			System.out.println("body111: " + body);
			JsonNode rootNode = mapper.readTree(body);
			result = rootNode.get("access_token").asText();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 private
	List<NameValuePair> convertParameter(Map<String, String> paramMap) {
		List<NameValuePair> paramList = new ArrayList<NameValuePair>();
		Set<Entry<String, String>> entries = paramMap.entrySet();
		for (Entry<String, String> entry : entries) {
			paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue()));
		}
		return paramList;
	}

	// 유저정보조회
	public HashMap<String, Object> getUserInfo(String access_Token, HttpSession session) {
		System.out.println("access_Token000: " + access_Token);
		HttpClient client = HttpClientBuilder.create().build();
		HttpGet get = new HttpGet(KAKAO_USER_INFO_URL);
		HashMap<String, Object> map = new HashMap<String, Object>();
		;
		get.setHeader("Authorization", "Bearer " + access_Token);
		try {
			HttpResponse res = client.execute(get);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());

			System.out.println("body000: " + body);

			JsonNode rootNode = mapper.readTree(body);
			if (rootNode.asText().equals("null")) {
				System.out.println("내역이 없습니다.");
				map.put("msg", "내역이 없습니다.");
			} else {
				// 이곳에서 데이터베이스 연동로직 처리할 것
				id = rootNode.get("id").asText();
				map.put("msg", "ok");
				map.put("id", id);
				map.put("access_Token", access_Token);
				map.put("connected_at", rootNode.get("connected_at").asText());
				map.put("name", rootNode.get("kakao_account").get("name").asText());
				map.put("email", rootNode.get("kakao_account").get("email").asText());
				map.put("phone", rootNode.get("kakao_account").get("phone_number").asText());

				UserVO vo = new UserVO();
				vo.setId(id);
				vo.setName(rootNode.get("kakao_account").get("name").asText());
				vo.setEmail(rootNode.get("kakao_account").get("email").asText());
				vo.setPhone(rootNode.get("kakao_account").get("phone_number").asText());
				
				// 숫자 이외의 모든 문자를 제거
				String numericString = vo.getPhone().replaceAll("[^0-9]", "");
				int length = numericString.length();
				numericString = numericString.substring(Math.max(length - 8, 0));

				vo.setPhone("010" + numericString);
				
				session.setAttribute("Kuser", vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}

//	@RequestMapping(value = "/")
//	public String home() {
//		return "/u_login";
//	}
}