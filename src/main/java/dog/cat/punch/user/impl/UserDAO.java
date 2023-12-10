package dog.cat.punch.user.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import dog.cat.punch.user.UserVO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	   // 탈퇴 여부
	   public int updateLeave(UserVO vo) {
	      return mybatis.update("UserDAO.updateLeave", vo);
	   }

	   // 아이디 찾기
	   public List<UserVO> checkId(UserVO vo) {
	      return mybatis.selectList("UserDAO.checkId", vo);
	   }
	
	//소셜로그인
	   public int joinSocialUser(UserVO vo) {
	      return mybatis.insert("UserDAO.joinSocialUser",vo);
	   }
	   
	//비밀번호 변경
		public int updatePw(UserVO vo) {
			return mybatis.update("UserDAO.updatePw",vo);
		} 
	
	
	//아이디찾기용 인증키 생성
	public int updateMailKey(UserVO vo){
	    return mybatis.update("UserDAO.updateMailKey", vo);
	}
	
	//비밀번호 찾기용 아이디 이메일 체크
	public int findPwCheck(UserVO vo){
	return mybatis.selectOne("UserDAO.findPwCheck", vo);	
	}


	public int findPw(String userEmail,String userId,String newPw){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("email", userEmail);
		map.put("id", userId);
		map.put("newPw", newPw);
		return mybatis.update("UserDAO.findPw", map);
	}
	
	public UserVO getUser(UserVO vo) {
		return (UserVO) mybatis.selectOne("UserDAO.getUser", vo);
	}
	
//	public List<UserVO> getUserList(String keyword) {
//		return mybatis.selectList("UserDAO.getUserList", keyword);
//	}
	
	//글목록 조회
	public List<UserVO> getUserList(UserVO vo) {
		System.out.println("===>mybatis로 getUserList() 기능처리");
		return mybatis.selectList("UserDAO.getUserList", vo);
	}

	public int joinUser(UserVO vo) {
		return mybatis.insert("UserDAO.joinUser",vo);
	}

	// 아이디 중복 체크
	public int idChk(UserVO vo) {
		int result = mybatis.selectOne("UserDAO.idChk", vo);
		return result;
	}
	
	public UserVO selUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.selUser",vo);
	}

	public int delUser(UserVO vo) {
		return mybatis.delete("UserDAO.delUser",vo);
	}
	
	//관리자용 회원정보 수정
	public int a_updateUser(UserVO vo) {
		return mybatis.update("UserDAO.a_updateUser",vo);
	}
	
	//회원용 회원정보 수정
		public int u_updateUser(UserVO vo) {
			return mybatis.update("UserDAO.u_updateUser",vo);
		}
	
	//전체 페이지 수 조회
	public int countUser(UserVO vo) {
		return mybatis.selectOne("UserDAO.countUser", vo);
	}
	
	public UserVO petInfo(UserVO vo) {
		return mybatis.selectOne("UserDAO.petInfo",vo);
	}
	
	public void updateFilename(UserVO vo) {
		mybatis.update("UserDAO.updateFilename", vo);
	}

}
