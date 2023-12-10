package dog.cat.punch.user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;



public interface UserService {

	public UserVO getUser(UserVO vo) ;
	//public List<UserVO> getUserList(String keyword);
	public List<UserVO> getUserList(UserVO vo);
	public int joinUser(UserVO vo);
	public UserVO selUser(UserVO vo);
	public int delUser(UserVO vo) ;
	
	//관리자용 회원정보 수정
	public int a_updateUser(UserVO vo) ;
	
	//회원용 마이페이지 수정
	public int u_updateUser(UserVO vo) ;
	
	//비밀번호 변경
	public int updatePw(UserVO vo) ;
	
	//소셜 회원가입(네이버, 카카오)
	public int joinSocialUser(UserVO vo);
	
	
	//회원 총 인원
	public int countUser(UserVO vo);
	
	//아이디 중복체크
	public int idChk(UserVO vo);
	
	//문자인증
//	public void sendMessage(HttpServletRequest request, String string); //현재안씀
	public void certifiedPhoneNumber(String phoneNumber, String numStr);
	
	//비번찾기 
	int findPwCheck(UserVO vo);
	void findPw(String memberEmail, String memberId) throws Exception;
	
	//아이디찾기용 메일키 발급
	int updateMailKey(UserVO vo);
	
	//아이디찾기
	public int findId(UserVO vo) throws Exception;
	
	
	  //아이디찾을때 이메일 컨펌
	   public List<UserVO> checkId(UserVO vo);
	    
	   //탈퇴 여부
	   public int updateLeave(UserVO vo);
	   
	 //펫정보 불러오기
	   public UserVO petInfo(UserVO vo);
	   
	   void updateFilename(UserVO vo);
	   
}