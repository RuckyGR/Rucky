package dog.cat.punch.view.controller;

import java.net.URLEncoder;
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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import dog.cat.punch.user.NaverVO;
import dog.cat.punch.user.UserService;
import dog.cat.punch.user.UserVO;


@Controller
public class NaverController {
	
	@Autowired
	private UserService userService;
	
	private static final String NAVER_AUTH_URL = "https://nid.naver.com/oauth2.0/authorize";
	private static final String NAVER_TOKEN_URL = "https://nid.naver.com/oauth2.0/token";
	private static final String NAVER_PROFIL_URL = "https://openapi.naver.com/v1/nid/me";
	private static final String NAVER_LOGOUT_URL = "https://nid.naver.com/nidlogin.logout";
	
	private String REDIRECT_URL = "";
	private static int inOutCheck;
	private static String tokenChk;
	
	@RequestMapping("/naverLogout")
	public String naverLoginOut(Model model, NaverVO vo){
	
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpGet get = new HttpGet(NAVER_LOGOUT_URL);
		model.addAttribute("naverInfo", null);
		try {
			HttpResponse res = client.execute(get); 
			res = client.execute(get); 
		}catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return "user/u_login";
	}
	
	@RequestMapping("/naverlogin")
	public String naverLoginView(Model model, NaverVO vo) {
		model.addAttribute("naver", vo);
		return "user/naverlogin";
	}
	
	@RequestMapping("/getNaverAuthUrl")
	public String getAuthUrl(NaverVO vo) {
		inOutCheck = vo.getInout();
		REDIRECT_URL = vo.getCallback_url()+"/login";
		String result = NAVER_AUTH_URL + "?state=success&response_type=code&auth_type=reauthenticate&client_id="+vo.getClient_id()+"&redirect_uri="+REDIRECT_URL;
//		String result = NAVER_AUTH_URL + "?state=success&response_type=code&client_id="+vo.getClient_id()+"&redirect_uri="+REDIRECT_URL;
		
		return "redirect:"+result;
	}
	
	
	@RequestMapping(value = "/login")
	public String oauthNaver(NaverVO vo , Model model, HttpSession session) throws Exception {
		String asToken = getToken(vo);
		vo.setAccess_token(asToken);
		System.out.println((inOutCheck==1?"로그인":"로그아웃" )+"의 토큰값: "+asToken);
		HashMap<String, Object> userInfo = getProfile(vo);
		model.addAttribute("naverInfo", userInfo);
		
		System.out.println("아이디가져오는지 테스트 : " + userInfo.get("id").toString());
		System.out.println("폰번호 테스트 : " + userInfo.get("mobile").toString().replace("-", ""));
		
		UserVO uv = new UserVO();
		
		uv.setId(userInfo.get("id").toString());
		uv.setName(userInfo.get("name").toString());
		uv.setEmail(userInfo.get("email").toString());
		uv.setPhone(userInfo.get("mobile").toString().replace("-", ""));
		
		session.setAttribute("Nuser", uv);
		
        return "redirect:/SocialLogin.do";
	}
	
	//접근토근 요청/응답정보
	public String getToken(NaverVO vo) throws Exception 
	{
		System.out.println(vo.toString());
		String apiUrl = NAVER_TOKEN_URL;
		
        HttpClient client = HttpClientBuilder.create().build(); 
		
		HttpPost post = new HttpPost(NAVER_TOKEN_URL); 
		Map<String,String> m =new HashMap<String,String>(); 
		m.put("grant_type", "authorization_code");
		m.put("client_id", vo.getClient_id()); //애플리케이션 클라이언트 아이디값";
		m.put("client_secret", vo.getClient_secret());//애플리케이션 클라이언트 시크릿값";
		m.put("redirect_uri", URLEncoder.encode(vo.getCallback_url(), "UTF-8")); 
		m.put("code", vo.getCode()); 
		m.put("state", vo.getState()); 
		
		
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post); 
			
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
//			System.out.println("body333: "+body);
			JsonNode rootNode = mapper.readTree(body); 
			tokenChk = rootNode.get("access_token").asText();
			
		}catch (Exception e) { 
			e.printStackTrace(); 
		}    
       
         
//		REDIRECT_URL = "http://localhost:8090";		
		REDIRECT_URL = "http://www.dogcatpunch.p-e.kr/";		
	    return tokenChk;
	    
	}
	
	// Map을 사용해서 Http요청 파라미터를 만들어 주는 함수 private
	List<NameValuePair> convertParameter(Map<String,String> paramMap){
		List<NameValuePair> paramList = new ArrayList<NameValuePair>(); 
		Set<Entry<String,String>> entries = paramMap.entrySet();
		for(Entry<String,String> entry : entries) {
		 paramList.add(new BasicNameValuePair(entry.getKey(), entry.getValue())); 
		} 
		return paramList; 
	}
	
	//네이버 프로필 정보 가져오기
	public HashMap<String, Object> getProfile(NaverVO vo) throws Exception {
        System.out.println("vo: "+vo);
        String header = "Bearer " + vo.getAccess_token(); // Bearer 다음에 공백 추가

        HttpClient client = HttpClientBuilder.create().build(); 
		HttpGet get = new HttpGet(NAVER_PROFIL_URL);
		HashMap<String, Object> map = null;
		get.setHeader("Authorization", header); 
		try {
			HttpResponse res = client.execute(get); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			
			System.out.println("body999: "+body);
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode response = rootNode.get("response"); 
			
			if(! rootNode.asText().equals("null")) {
				map = new HashMap<String, Object>();
				//이곳에서 데이터베이스 연동로직 처리할 것
				System.out.println("id: "+response.get("id").asText() );
				System.out.println("age: "+response.get("age").asText() );
				System.out.println("gender: "+ response.get("gender").asText() );
				System.out.println("email: "+ response.get("email").asText() );
				System.out.println("mobile: "+response.get("mobile").asText());
				System.out.println("nickname: "+response.get("nickname").asText());
				
				map.put("msg","ok" );
				map.put("id",response.get("id").asText() );
				map.put("name",response.get("name").asText() );
				map.put("age",response.get("age").asText() );
				map.put("gender", response.get("gender").asText() );
				map.put("email", response.get("email").asText() );
				map.put("mobile",response.get("mobile").asText());
				map.put("nickname",response.get("nickname").asText());
				
				
			}
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
    	return map; 
        
    }
	
}
