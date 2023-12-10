package dog.cat.punch.order;

import java.util.List;

import dog.cat.punch.user.UserVO;

public interface OrderService {

	// 주문서
	// 주문자 정보
	public UserVO getUserInfo(String uid);
	// 주문 상품 정보
	public List<OrderItemDTO> getOrderItem(List<OrderItemDTO> orders);
	
	// 주문서 작성
	void insertOrder(OrderDTO ord);
	
	// 주문 목록
	public List<OrderDTO> getOrderList(OrderDTO ord);
	public int countOrder(OrderDTO ord);

	// 주문 상세
	public OrderDTO getOrderInfo(String od_num);
	public List<OrderItemDTO> getOrderDetail(String od_num);

	// 주문 수정
	void updateOrder(OrderDTO ord);
	
	// 주문 취소
	void cancelOrder(String od_num);
	

	
}
