package dog.cat.punch.products;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class ProductsDAO {

	@Autowired
	SqlSessionTemplate mybatis;

	public List<ProductsVO> getProductsList(ProductsVO vo) {
		System.out.println("===>mybatis getProductsList() 기능처리");
		return mybatis.selectList("ProductsMapper.getproductsList",vo);
	}

	public ProductsVO getProducts(ProductsVO vo) {
		System.out.println("===>mybatis  getProducts() 기능처리");
		return mybatis.selectOne("ProductsMapper.selectOne", vo);
	}

	public void insertProducts(ProductsVO vo) {
		System.out.println("===>mybatis로 insertProducts() 기능처리");
		mybatis.insert("ProductsMapper.insertProducts", vo);
	}

	public void updateProducts(ProductsVO vo) {
		System.out.println("===>mybatis로 updateProduct() 기능처리");
		mybatis.update("ProductsMapper.updateProducts", vo);
	}
	
	public List<ProductsVO> userProductsList(ProductsVO vo){
		System.out.println("===>mybatis로 userProductsList() 기능처리");
		return mybatis.selectList("ProductsMapper.u_productsList", vo);
	}
	
	public void deleteProducts(ProductsVO vo) {
		System.out.println("===>mybatis로 deleteProducts() 기능처리");
		mybatis.delete("ProductsMapper.deletProducts", vo);
	}
	
	//전체 페이지 수 조회
	public int countPro(ProductsVO vo) {
		System.out.println("ProductsDAO실행 mybatis");
		return mybatis.selectOne("ProductsMapper.countPro",vo);
	}
	public int countType(ProductsVO vo) {
		System.out.println("ProductsDAO실행 mybatis");
		return mybatis.selectOne("ProductsMapper.countType",vo);
	}
	
	public ProductsVO selProducts(ProductsVO vo) {
		return mybatis.selectOne("ProductsMapper.selProducts",vo);
	}

	public LikeVO bringLike(LikeVO like) {
		return mybatis.selectOne("ProductsMapper.bringLike", like);
	}

	public List<LikeVO> likeList(String id) {
		return mybatis.selectList("ProductsMapper.selLike", id);
	}
	
	public List<LikeVO> likeMyList(String id) {
		return mybatis.selectList("ProductsMapper.selMyLike", id);
	}

	public int checkLike(LikeVO vo) {
		return mybatis.insert("ProductsMapper.checkLike", vo);
	}

	public void deleteLike(LikeVO vo) {
		System.out.println("DAO : " + vo);
		mybatis.delete("ProductsMapper.deleteLike", vo);
	}
	// 이미지 
			public void updateFilename(ProductsVO  vo) {
			System.out.println("===>mybatis로 updateFilename() 기능처리"+ vo);
			mybatis.update("ProductsMapper.updateFilename", vo);
		}

	public List<ProductsVO> cookieList(List<Integer> noArr) {
		Map<String, List<Integer>> map = null;
		if(noArr != null) {
			map = new HashMap<>();
			map.put("noArr", noArr);
		}
		return mybatis.selectList("ProductsMapper.cookieList", map);
	}

	public void selectDelLike(String aa) {
		mybatis.delete("ProductsMapper.selectDelLike", aa);
	}
	
	public List<ProductsVO> bestItem() {
		return mybatis.selectList("ProductsMapper.bestItem");
	}
	
	public List<ProductsVO> headerSearch(ProductsVO vo){
		return mybatis.selectList("ProductsMapper.headerSearchList", vo);
	}


}
