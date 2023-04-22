package com.good.neighbor.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.good.neighbor.model.ProductDTO;
import com.good.neighbor.util.PageTest;

@Service
public class ProductServiceImpl implements ProductService {

  @Autowired
  SqlSessionFactory sqlSessionFactory;

  // 0.상품 총 개수 구하기 ------------------------------------------------------------------------>
  @Override
  public int countProduct() throws IOException {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    int count = sqlSession.selectOne("product.countProduct");
    sqlSession.close();
    return count;
  }

  // 1.상품 등록 ---------------------------------------------------------------------------------->
  @Override
  public void insertProduct(ProductDTO productDTO) throws IOException {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.insert("product.insertProduct", productDTO);
    sqlSession.commit();
    sqlSession.close();
  }

  // 2.상품 목록 ---------------------------------------------------------------------------------->
  @Override
  public List<ProductDTO> listProduct(PageTest pageTest) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    pageTest.setSkip((pageTest.getCurPage() - 1) * pageTest.getPageSize());
    pageTest.setAmount(pageTest.getPageSize());
    Map<String, Object> map = new HashMap<>();
    map.put("pageTest", pageTest);
    List<ProductDTO> productList = sqlSession.selectList("product.listProduct", map);
    sqlSession.close();
    return productList;
  }

  // 3.상품 상세 ---------------------------------------------------------------------------------->
  @Override
  public ProductDTO detailProduct(int product_id) throws IOException {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    ProductDTO productDTO = sqlSession.selectOne("product.detailProduct", product_id);
    sqlSession.close();
    return productDTO;
  }

  // 4.상품 검색 ---------------------------------------------------------------------------------->
  @Override
  public List<ProductDTO> searchProduct(String product_name) throws IOException {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    List<ProductDTO> productList = sqlSession.selectList("product.searchProduct", product_name);
    sqlSession.close();
    return productList;
  }

  // 5.상품 수정 ---------------------------------------------------------------------------------->
  @Override
  public void updateProduct(ProductDTO productDTO) throws IOException {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.update("product.updateProduct", productDTO);
    sqlSession.commit();
    sqlSession.close();
  }

  // 6.상품 삭제 ---------------------------------------------------------------------------------->
  @Override
  public void deleteProduct(int product_id) throws IOException {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.delete("product.deleteProduct", product_id);
    sqlSession.commit();
    sqlSession.close();
  }

}