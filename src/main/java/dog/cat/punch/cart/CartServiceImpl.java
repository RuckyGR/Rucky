package dog.cat.punch.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("cartService")
public class CartServiceImpl implements CartService {

	@Autowired
	private CartDAO cartDAO;

	@Override
	public int insertCart(CartVO cartVO) {
		CartVO checkCart = cartDAO.checkCart(cartVO);

		if (checkCart != null) {
			return 2;
		}

		try {
			return cartDAO.insertCart(cartVO);
		} catch (Exception e) {
			return 0;
		}

	}

	@Override
	public List<CartVO> getCart(String id) {
		return cartDAO.getCart(id);
	}

	@Override
	public int deleteCart(int cart_no) {
		return cartDAO.deleteCart(cart_no);
	}

	@Override
	public int modifyCount(CartVO cartVO) {
		return cartDAO.modifyCount(cartVO);
	}

	@Override
	public int deleteAllCart(String id) {
		return cartDAO.deleteAllCart(id);
	}

	@Override
	public int sumMoney(String id) {
		return cartDAO.sumMoney(id);
	}

	@Override
	public CartVO modifyQuantity(CartVO vo) {
		return cartDAO.modifyQuantity(vo);
	}

	@Override
	public void selectDel(String aa) {
		cartDAO.selectDel(aa);
	}

}
