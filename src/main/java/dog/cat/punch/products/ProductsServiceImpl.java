package dog.cat.punch.products;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service("ProductsService")
public class ProductsServiceImpl implements ProductsService{
	@Autowired
	ProductsDAO dao;
	
	
	@Override
	public List<ProductsVO> userProductsList(ProductsVO vo) {
		return dao.userProductsList(vo);
	}

	@Override
	public List<ProductsVO> getProductsList(ProductsVO vo) {
		return dao.getProductsList(vo);
	}

	@Override
	public ProductsVO getProducts(ProductsVO vo) {
		return dao.getProducts(vo);
	}
	@Override
	public void insertProducts(ProductsVO vo) {
		dao.insertProducts(vo);
	}
	
	@Override
	public void updateProducts(ProductsVO vo) {
		dao.updateProducts(vo);
	}

	@Override
	public void deleteProducts(ProductsVO vo) {
		dao.deleteProducts(vo);
	}

	
	
	@Override
	public int countPro(ProductsVO vo) {
		return dao.countPro(vo);
	}
	
	@Override
	public int countType(ProductsVO vo) {
		return dao.countType(vo);
	}
	
	@Override
	public ProductsVO selProducts(ProductsVO vo) {
		return dao.selProducts(vo);
	}

	@Override
	public LikeVO bringLike(LikeVO like) {
		return dao.bringLike(like);
	}

	@Override
	public int checkLike(LikeVO vo) {
		int result = 0;
		
		LikeVO find = dao.bringLike(vo);
		if(find == null) {
			result = dao.checkLike(vo);
		} else {
			dao.deleteLike(vo);
		}
		return result; 
	}

	@Override
	public List<LikeVO> likeList(String id) {
		return dao.likeList(id);
	}
	
	@Override
	public List<LikeVO> likeMyList(String id) {
		return dao.likeMyList(id);
	}

	@Override
	public void deleteLike(LikeVO vo) {
		dao.deleteLike(vo);
	}

	@Override
	public List<ProductsVO> cookieList(List<Integer> noArr) {
		return dao.cookieList(noArr);
	}
	
	@Override
	public void updateFilename(ProductsVO vo) {
		System.out.println("21512"+vo);
	
	}

	@Override
	public void selectDelLike(String aa) {
		dao.selectDelLike(aa);  
	}
	
	@Override
	public List<ProductsVO> bestItem() {
		return dao.bestItem();
	}

	@Override
	public List<ProductsVO> headerSearch(ProductsVO vo) {
		return dao.headerSearch(vo);
	}
}
