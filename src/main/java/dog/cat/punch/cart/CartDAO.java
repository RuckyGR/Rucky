package dog.cat.punch.cart;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CartDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	public int insertCart(CartVO cartVO) {
		return mybatis.insert("CartDAO.insertCart", cartVO);
	}

	public List<CartVO> getCart(String id) {
		return mybatis.selectList("CartDAO.cartList", id);
	}

	public int deleteCart(int cart_no) {
		return mybatis.delete("CartDAO.deleteCart", cart_no);
	}

	public int modifyCount(CartVO cartVO) {
		return mybatis.update("CartDAO.updateCartCount", cartVO);
	}

	public CartVO checkCart(CartVO cartVO) {
		return mybatis.selectOne("CartDAO.checkCart", cartVO);
	}

	public int deleteAllCart(String id) {
		return mybatis.delete("CartDAO.deleteCartAll", id);
	}

	public int sumMoney(String id) {
		return mybatis.selectOne("CartDAO.sumMoney", id);
	}
	
	public CartVO modifyQuantity(CartVO vo) {
		return mybatis.selectOne("CartDAO.modifyQuantity", vo);
	}

	public void selectDel(String aa) {
		mybatis.delete("CartDAO.selectDel", aa);
	}
}
