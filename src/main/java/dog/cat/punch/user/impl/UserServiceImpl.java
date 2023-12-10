package dog.cat.punch.user.impl;

import java.util.HashMap;
import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import dog.cat.punch.user.UserService;
import dog.cat.punch.user.UserVO;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDAO;

	@Autowired
	JavaMailSender mailSender;

	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public int joinUser(UserVO vo) {
		return userDAO.joinUser(vo);
	}

	// 아이디 중복 체크
	@Override
	public int idChk(UserVO vo) {
		return userDAO.idChk(vo);
	}

	@Override
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}

	@Override
	public int countUser(UserVO vo) {
		return userDAO.countUser(vo);
	}

	@Override
	public UserVO selUser(UserVO vo) {
		return userDAO.selUser(vo);
	}

	@Override
	public int delUser(UserVO vo) {
		return userDAO.delUser(vo);
	}

	// 관리자용 회원정보 수정
	@Override
	public int a_updateUser(UserVO vo) {
		return userDAO.a_updateUser(vo);
	}

	// 회원용 마이페이지 수정
	@Override
	public int u_updateUser(UserVO vo) {
		return userDAO.u_updateUser(vo);
	}

	@Override
	public int updatePw(UserVO vo) {
		return userDAO.updatePw(vo);
	}

	// 회원가입시 본인인증 문자 발송
	public void certifiedPhoneNumber(String phoneNumber, String numStr) {
		
		//api key, secret 선생님 제출시엔 지우기
		String api_key = "NCSI8TE8BLHD6ZAT";
		String api_secret = "TLCL0EL5KCYOZBZDDXEOBIDHVSI1ASMV";
		Message coolsms = new Message(api_key, api_secret);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber);
		params.put("from", "01095566594");
		params.put("type", "SMS");
		params.put("text", "[dogcatpunch] 본인확인 인증번호 (" + numStr + ") 를 입력하세요.");
		params.put("app_version", "test app 1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}

	}

	@Override
	public int findPwCheck(UserVO vo) {
		return userDAO.findPwCheck(vo);
	}

	// 임시비밀번호 발급
	@Override
	public void findPw(String userEmail, String userId) throws Exception {
		String userKey = new TempKey().getKey(6, false);
		String userPw = BCrypt.hashpw(userKey, BCrypt.gensalt());
		userDAO.findPw(userEmail, userId, userPw);
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[dogcatpunch 임시 비밀번호 입니다.]"); // 메일제목
		sendMail.setText("<h1>임시비밀번호 발급</h1>" + "<br>" + userId + "님 " + "<br>비밀번호 찾기를 통한 임시 비밀번호입니다."
				+ "<br>임시비밀번호 :   <h2>" + userKey + "</h2>" + "<br>로그인 후 비밀번호 변경을 해주세요.<br>"
				+ "<a href='http://localhost:8090/login.do'>로그인 페이지</a>");
		sendMail.setFrom("luvv6594@gmail.com", "dogcatpunch");
		sendMail.setTo(userEmail);
		sendMail.send();
	}

	// 필요없음 나중에 지울예정
	@Override
	public int updateMailKey(UserVO vo) {
		return userDAO.updateMailKey(vo);
	}

	@Override
	public int findId(UserVO vo) throws Exception {

		// 랜덤 문자열을 생성해서 mail_key 컬럼에 넣어주기
		String mail_key = new TempKey().getKey(30, false); // 랜덤키 길이 설정
		vo.setMail_key(mail_key);

		int idct = userDAO.updateMailKey(vo);
		if (idct == 0) {
			return idct;
		} else {
			// 아이디찾기 인증을 위한 이메일 발송
			MailHandler sendMail = new MailHandler(mailSender);
			sendMail.setSubject("[dogcatpunch 인증메일 입니다.]"); // 메일제목
			sendMail.setText("<h1>dogcat 메일인증</h1>" + "<br>dogcatpunch에 오신것을 환영합니다!" + "<br>아래 [이메일 인증 확인]을 눌러주세요."
					+ "<br><a href='http://localhost:8090/confirmEmail?email=" + vo.getEmail() + "&mail_key="
					+ vo.getMail_key() + "' target='_blank'>아이디찾기 이메일 인증 확인</a>");
			sendMail.setFrom("luvv6594@gmail.com", "dogcatpunch");
			sendMail.setTo(vo.getEmail());
			System.out.println("아이디 알려줘 : " + vo.getId());
			sendMail.send();
			return idct;
		}
	}

	// 이메일 아이디찾기 확인
	@Override
	public List<UserVO> checkId(UserVO vo) {
		System.out.println("서비스 임플은????:ㅣㅣ   " + vo);
		return userDAO.checkId(vo);
	}

	// 탈퇴 여부
	@Override
	public int updateLeave(UserVO vo) {
		return userDAO.updateLeave(vo);
	}

	// 카카오 로그인
	@Override
	public int joinSocialUser(UserVO vo) {
		return userDAO.joinSocialUser(vo);
	}

	@Override
	public UserVO petInfo(UserVO vo) {
		return userDAO.petInfo(vo);
	}

	@Override
	public void updateFilename(UserVO vo) {
		userDAO.updateFilename(vo);

	}
}
