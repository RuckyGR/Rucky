package dog.cat.punch.view.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import dog.cat.punch.order.OrderDTO;
import dog.cat.punch.order.OrderService;


@Controller
public class OrderPaymentController {
	
	@Autowired
	private OrderService orderService;
	
	//REST API사용을 위한 인증(access_token취득)
	public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
	
	//결제 단건조회(고유 가맹점 주문번호 조회) API
	public static final String IMPORT_PAYMENTINFO_URL = "https://api.iamport.kr/payments/find/";
	
	//결제상태기준 복수조회 API
	public static final String IMPORT_PAYMENTLIST_URL = "https://api.iamport.kr/payments/status/all";
	
	//결제취소 API
	public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
	
	//payments.validation : payments확장기능. 결제될 내역에 대한 사전정보 등록&검증
	//POST /payments/prepare결제금액 사전등록 API
	public static final String IMPORT_PREPARE_URL = "https://api.iamport.kr/payments/prepare";
	
	//"아임포트 Rest Api key로 설정";
	public static final String KEY = "";
	//"아임포트 Rest Api Secret로 설정"; 
	public static final String SECRET =  "";
	//"가맹점 식별코드 값으로 설정"
	public static final String IMPKEY = "imp10707030"; 
	
	// 아임포트 인증(토큰)을 받아주는 함수 
	public String getImportToken() {
		String result = "";
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpPost post = new HttpPost(IMPORT_TOKEN_URL); 
		Map<String,String> m =new HashMap<String,String>(); 
		m.put("imp_key", KEY);
		m.put("imp_secret", SECRET); 
		try { 
			post.setEntity( new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response"); 
			result = resNode.get("access_token").asText(); 
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return result;
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
	
	// 아임포트 결제금액 변조는 방지하는 함수 
	 public void setHackCheck(String amount,String mId,String token) { 
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_PREPARE_URL);
		Map<String,String> m =new HashMap<String,String>();
		post.setHeader("Authorization", token);
		m.put("amount", amount); 
		m.put("merchant_uid", mId);
		try { 
			post.setEntity(new UrlEncodedFormEntity(convertParameter(m)));
			HttpResponse res = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			String body = EntityUtils.toString(res.getEntity());
			JsonNode rootNode = mapper.readTree(body);
			System.out.println(rootNode); 
		} catch (Exception e) {
			e.printStackTrace(); 
		} 
	} 

	// 결제취소
 	@RequestMapping(value="/paycan" , method = RequestMethod.POST)
	public String cancelPayment(String mid, HttpSession session, Model model, HttpServletResponse response) throws IOException {
		String token = getImportToken();
		HttpClient client = HttpClientBuilder.create().build();
		HttpPost post = new HttpPost(IMPORT_CANCEL_URL); 
		Map<String, String> map = new HashMap<String, String>();
		post.setHeader("Authorization", token);
		map.put("merchant_uid", mid); 
		String asd = ""; 
		String uid = (String) session.getAttribute("userId");
		try {
			post.setEntity(new UrlEncodedFormEntity(convertParameter(map)));
			HttpResponse res = client.execute(post); 
			ObjectMapper mapper = new ObjectMapper(); 
			String enty = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(enty); 
			asd = rootNode.get("response").asText(); 
			
			System.out.println("uid : " + uid);
			System.out.println("od_num : " + mid);
			
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		if(uid.equals("admin")) {
			if (asd.equals("null")) {
				System.err.println("환불실패");
				
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				out.println("<script> alert('주문취소 실패하였습니다.');");
				out.println("history.go(-1); </script>"); 
				out.close();
				
				return "forward:a_listOrder.od";
			} else {
				System.err.println("환불성공");
				orderService.cancelOrder(mid);
				
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				response.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");
				out.println("<script> alert('주문취소되었습니다.');");
				out.println("history.go(-1); </script>"); 
				out.close();
				
				return "forward:a_listOrder.od";
			} 
		}else {
			if (asd.equals("null")) {
				System.err.println("환불실패");
				model.addAttribute("cancel", "y");
				return "/order/u_cancelSuccess";
			} else {
				System.err.println("환불성공");
				orderService.cancelOrder(mid);
				model.addAttribute("od_num", mid);
				model.addAttribute("uid", uid);
				return "/order/u_cancelSuccess"; 
			} 
		}
	}
	
	//상품결제 폼 호출
	@RequestMapping(value="/paymobile")
	public String paymobile(HttpServletRequest request, Model model, OrderDTO od) {
		System.out.println("<<	payment, insertOrder Controller	>>");		
		
		String amount = request.getParameter("amount");
		String mid = request.getParameter("od_num");
		String od_paid = request.getParameter("paid_at");
		System.out.println(od_paid);
		String token = getImportToken();
		
		od.setOd_num(mid);
		od.setOd_payment("카드결제");
		od.setOd_payprice(Integer.parseInt(amount));
		od.setOd_paid(od_paid);
		System.out.println(od);		
		orderService.insertOrder(od);
		
		model.addAttribute("id", od.getId());
		model.addAttribute("od_num", mid);
		model.addAttribute("od_totprice", amount);
		
		setHackCheck(amount, mid, token);
		
		return "order/u_insertSuccess";
	}
	
	 
	//결제 진행 폼=> 이곳에서 DB저장 로직도 추가하기
	@RequestMapping(value="/pay")
	public String payweb(HttpServletRequest request, HttpServletResponse response, Model model, OrderDTO od) throws IOException {
		
		System.out.println("<<	payment, insertOrder Controller	>>");		
		
		String amount = request.getParameter("amount");
		String mid = request.getParameter("merchant_uid");
		String od_paid = request.getParameter("paid_at");
		System.out.println(od_paid);
		String token = getImportToken();
		
		
		od.setOd_num(mid);
		od.setOd_payment("카드결제");
		od.setOd_payprice(Integer.parseInt(amount));
		od.setOd_paid(od_paid);
		System.out.println(od);		
		orderService.insertOrder(od);
		
		model.addAttribute("id", od.getId());
		model.addAttribute("od_num", mid);
		model.addAttribute("od_totprice", amount);
		
		setHackCheck(amount, mid, token);
		
		return "order/u_insertSuccess";
	}
	
	@RequestMapping(value="/payments/complete")
	public void paymentMobile(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String imp_uid = request.getParameter("imp_uid");
		String mid = request.getParameter("merchant_uid");
		String imp_success = request.getParameter("imp_success");
		String error_code = request.getParameter("error_code");
		String error_msg = request.getParameter("error_msg");
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<head><title>주문완료</title></head>");
		out.println("<body>");
		out.print("고유 ID: "+imp_uid+"<br>");
		out.print("상점 거래ID: "+mid+"<br>");
		out.print("성공 여부: "+imp_success+"<br>");
		out.print("에러 코드: "+error_code+"<br>");
		out.print("에러 메세지: "+error_msg+"<br>");
		out.print("<a href='/pay'>쇼핑 계속하기</a>");
		out.print("<a href='javascript:(\"준비중입니다.\");'>나의 주문내역</a>");
		out.println("</body></html>");
	}
	
	// 아임포트 결제완료/취소건에 한하여 목록 반환 
	@RequestMapping(value="/payamount")
	@ResponseBody
	public Object getAmount(HttpServletRequest request, OrderDTO od) { // 파라미터 : mid = 상점 주문번호, status = /paid
		String mid = request.getParameter("mid");
		String token = getImportToken();
		System.out.println("토큰값: "+token);
		System.out.println("mid값: "+mid);
		Map<String, String> map = new HashMap<String, String>();
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpGet get = new HttpGet(IMPORT_PAYMENTINFO_URL + mid + request.getParameter("status"));
		get.setHeader("Authorization", token); 
		try {
			HttpResponse res = client.execute(get); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response"); 
			System.out.println("777: " + resNode);
			if(resNode.asText().equals("null")) {
				System.out.println("내역이 없습니다.");
				map.put("msg","내역이 없습니다." );
			}else {
				map.put("imp_uid",resNode.get("imp_uid").asText() );
				map.put("merchant_uid",resNode.get("merchant_uid").asText() );
				map.put("name",resNode.get("name").asText() );
				map.put("paid_at",resNode.get("paid_at").asText() );
				map.put("pay_method",resNode.get("pay_method").asText() );
				map.put("buyer_name",resNode.get("buyer_name").asText() );
				map.put("amount",resNode.get("amount").asText() );
				System.out.println(resNode.get("paid_at").asText());
				System.out.println(resNode.get("pay_method").asText());
				
			}
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		return map; 
	} 
	
	// 아임포트 전체 목록 반환 
	@RequestMapping(value="/paylist")
	public Object getlist() { 
		String token = getImportToken();
		System.out.println("토큰값: "+token);
		List<Object> list = new ArrayList<Object>();
		HttpClient client = HttpClientBuilder.create().build(); 
		HttpGet get = new HttpGet(IMPORT_PAYMENTLIST_URL);
		get.setHeader("Authorization", token); 
		try {
			HttpResponse res = client.execute(get); 
			ObjectMapper mapper = new ObjectMapper(); 
			String body = EntityUtils.toString(res.getEntity()); 
			JsonNode rootNode = mapper.readTree(body); 
			JsonNode resNode = rootNode.get("response").get("list"); 
			System.out.println("555 rootNode: " + rootNode);
			System.out.println("555 resNode: " + resNode);
			
			for(int i=0; i< resNode.size();i++) {
				Map<String, String> map = new HashMap<String, String>();
				map.put("imp_uid",resNode.get(i).get("imp_uid").asText() );
				map.put("merchant_uid",resNode.get(i).get("merchant_uid").asText() );
				map.put("name",resNode.get(i).get("name").asText() );
				map.put("buyer_name",resNode.get(i).get("buyer_name").asText() );
				map.put("amount",resNode.get(i).get("amount").asText() );
				map.put("cancel_amount",resNode.get(i).get("cancel_amount").asText() );
				map.put("failed_at",resNode.get(i).get("failed_at").asText() );
				list.add(map);
			}
			
		} catch (Exception e) { 
			e.printStackTrace(); 
		}
		return list; 
	} 
	 
	 

}
