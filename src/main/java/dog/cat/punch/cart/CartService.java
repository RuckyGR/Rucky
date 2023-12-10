package dog.cat.punch.cart;

import java.util.List;

public interface CartService {

	//장바구니추가
	public int insertCart(CartVO cartVO);
	
	//아이디에 장바구니 가져오기
	public List<CartVO> getCart(String id);
	
	//장바구니 한개삭제
	public int deleteCart(int cart_no);
	
	//수량변경
	public int modifyCount(CartVO cartVO);
	
	//장바구니 전체삭제
	public int deleteAllCart(String id);
	
	//장바구니 금액합계
	int sumMoney(String id);
	
	public CartVO modifyQuantity(CartVO vo);

	public void selectDel(String aa);
	
}