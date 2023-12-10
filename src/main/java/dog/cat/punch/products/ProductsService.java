package dog.cat.punch.products;

import java.util.List;



public interface ProductsService {

	public List<ProductsVO> getProductsList(ProductsVO vo);
	public List<ProductsVO> userProductsList(ProductsVO vo);

	public ProductsVO getProducts(ProductsVO vo);

	void insertProducts(ProductsVO vo);

	// 글수정
	void updateProducts(ProductsVO vo);

	// 글삭제
	void deleteProducts(ProductsVO vo);

	int countPro(ProductsVO vo);
	int countType(ProductsVO vo);
	
	public ProductsVO selProducts(ProductsVO vo);
	
	public LikeVO bringLike(LikeVO like);

	public int checkLike(LikeVO vo);
	
	public List<LikeVO> likeList(String id);
	
	public void deleteLike(LikeVO vo);
	
	public List<ProductsVO> cookieList(List<Integer> noArr);
	
	void updateFilename(ProductsVO vo);
	
	public void selectDelLike(String string);
	
	List<ProductsVO> bestItem();
	List<LikeVO> likeMyList(String id);
	List<ProductsVO> headerSearch(ProductsVO vo);
}
