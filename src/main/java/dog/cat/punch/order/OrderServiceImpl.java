package dog.cat.punch.order;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestBody;

import dog.cat.punch.user.UserVO;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDAO orderDAO;
	
//	주문서에 정보 불러오기
//	@Override
	public List<OrderItemDTO> getOrderItem(List<OrderItemDTO> orders) {
//		System.out.println("getOrderItem service : " + orders);
		
		List<OrderItemDTO> result = new ArrayList<OrderItemDTO>();
		
		int index_no = 0;
		
		for(OrderItemDTO ord : orders) {
			OrderItemDTO goodsInfo = orderDAO.getOrderItem(ord.getPro_no());
			goodsInfo.setOd_count(ord.getOd_count());
			goodsInfo.setIndex_no(index_no);
			goodsInfo.sumPrice();
			result.add(goodsInfo);		
			index_no += 1;
		}
		
//		System.out.println("getOrderItem service / result: " + result);
		return result;
	}
	
	//	주문자 정보
	@Override
	public UserVO getUserInfo(String uid) {
		System.out.println("getUserInfo service : " + uid);
		return orderDAO.getUserInfo(uid);
	}

//	주문하기
	@Override
	public void insertOrder(OrderDTO ord) {
//		System.out.println("<<	insertOrder service	 >>");
//		System.out.println("OrderDTO : " + ord);
		
//		회원정보
		UserVO user = orderDAO.getUserInfo(ord.getId());
//		System.out.println("service > getUserInfo user : " + user);
		
//		주문정보
		List<OrderItemDTO> ords = new ArrayList<>();
		
		int od_payprice = 0;
		int index_no = 0;
		for(OrderItemDTO oid : ord.getOrders()) {
//			System.out.println("service  oid.getPro_no() : " + oid.getPro_no() );
			OrderItemDTO orderItem = orderDAO.getOrderItem(oid.getPro_no());
//			System.out.println("service  oid.getOd_count() : " + oid.getOd_count());
			orderItem.setOd_count(oid.getOd_count());
			orderItem.sumPrice();
			orderItem.setIndex_no(index_no);
			index_no += 1;
			od_payprice += oid.getOd_price();
			ords.add(orderItem);
		}
		
//		od_num
		String od_num = ord.getOd_num();
		System.out.println("service  od_num : " + od_num );
		
//		orderDTO 세팅
		if(od_payprice < 50000) { od_payprice += 5000; }
		ord.setOd_payprice(od_payprice);
		ord.setOd_num(od_num);
		
//		DB insert
		orderDAO.insertOrderInfo(ord);
		for(OrderItemDTO oit : ord.getOrders()) {
			oit.setOd_num(od_num);
			orderDAO.insertOrderPro(oit);
		}
	}
	
//	주문목록
	@Override
	public List<OrderDTO> getOrderList(OrderDTO ord) {
		System.out.println("getOrderList service : " + ord);
		return orderDAO.getOrderList(ord);
	}
	@Override
	public int countOrder(OrderDTO ord) {
//		System.out.println("countOrder service : " + ord);
		return orderDAO.countOrder(ord);
	}
	
//	주문상세
//	주문정보
	@Override
	public OrderDTO getOrderInfo(String od_num) {
//		System.out.println("getOrderInfo service : " + od_num);
		return orderDAO.getOrderInfo(od_num);
	}
//	주문상품목록
	@Override
	public List<OrderItemDTO> getOrderDetail(String od_num) {
//		System.out.println("getOrderItemno service : " + od_num);
		return orderDAO.getOrderDetail(od_num);
	}
	
	
//	주문수정
	@Override
	public void updateOrder(OrderDTO ord) {
		System.out.println("updateOrder service : " + ord);
		orderDAO.updateOrder(ord);
	}

//	주문취소
	@Override
	public void cancelOrder(String od_num) {
//		System.out.println("cancelOrder service : " + od_num);
		orderDAO.cancelOrder(od_num);
	}





}
