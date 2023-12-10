package dog.cat.punch.order;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import dog.cat.punch.user.UserVO;

@Repository
public class OrderDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	// 주문 상품 정보
	public OrderItemDTO getOrderItem(int pro_no) {
//		System.out.println("<<	getOrderInfo dao	>>\n pro_no : "  + pro_no);
		return mybatis.selectOne("OrderDAO.getOrderItem", pro_no);
	}
	
	//	주문자 정보
	public UserVO getUserInfo(String uid) {
//		System.out.println("<<	getUserInfo dao >>\n uid : " + uid);
		return mybatis.selectOne("OrderDAO.getUserInfo", uid);
	};
	
	
	// 주문하기
	// orderinfo insert
	public void insertOrderInfo(OrderDTO ord) {
//		System.out.println("<<	insertOrderInfo dao >>");
//		System.out.println(ord);
		mybatis.insert("OrderDAO.insertOrderInfo", ord); 
	}
	// orderpro insert
	public void insertOrderPro(OrderItemDTO ord) {
//		System.out.println("<<	insertOrderPro dao >>");
		mybatis.insert("OrderDAO.insertOrderPro", ord); 
	}

	// 주문 목록
	public List<OrderDTO> getOrderList(OrderDTO ord){
//		System.out.println("=> mybatis getOrderList()");
//		System.out.println(ord);
		return mybatis.selectList("OrderDAO.getOrderList", ord);
	}
	public int countOrder(OrderDTO ord){
//		System.out.println("=> mybatis countOrder()");
//		System.out.println(ord);
		return mybatis.selectOne("OrderDAO.countOrder", ord);
	}
	
	// 주문 상세
	public OrderDTO getOrderInfo(String od_num){
//		System.out.println("=> mybatis getOrderInfo() : " + od_num);
		return mybatis.selectOne("OrderDAO.getOrderInfo", od_num);
	}
	public List<OrderItemDTO> getOrderDetail(String od_num){
//		System.out.println("=> mybatis getOrderItemno() : " + od_num);
		return mybatis.selectList("OrderDAO.getOrderDetail", od_num);
	}
	
	// 주문 수정
	void updateOrder(OrderDTO ord) {
//		System.out.println("=> mybatis updateOrder()");
		mybatis.update("OrderDAO.updateOrder", ord);
	}
	
	// 주문 취소
	void cancelOrder(String od_num) {
		System.out.println("=> mybatis cancelOrder()");
		mybatis.update("OrderDAO.cancelOrder", od_num);
	}
	
	// 주문 목록 검색
//	// 기간 조회
//	public List<OrderDTO> searchOrderDate(String start, String end){
//		System.out.println("=> mybatis searchOrderDate()");
//		return mybatis.selectList("OrderDAO.searchOrderDate", start);
//	}
//	// 최근 1, 3, 6개월
//	public List<OrderDTO> searchOrderMonth(int month){
//		System.out.println("=> mybatis searchOrderMonth()");
//		return mybatis.selectList("OrderDAO.searchOrderMonth", month);
//	}
//	// 6개월 이전
//	public List<OrderDTO> searchOrderSix(){
//		System.out.println("=> mybatis searchOrderSix()");
//		return mybatis.selectList("OrderDAO.searchOrderSix");
//	}
//	// 주문상태
//	public List<OrderDTO> searchOrderDelivery(String od_delivery){
//		System.out.println("=> mybatis searchOrderDelivery()");
//		return mybatis.selectList("OrderDAO.searchOrderDelivery", od_delivery);
//	}
//	// 주문자정보 검색
//	public List<OrderDTO> searchOrderTo(String start, String end){
//		System.out.println("=> mybatis searchOrderTo()");
//		return mybatis.selectList("OrderDAO.searchOrderTo", start);
//	}

	
}
