package com.good.neighbor.service;

import java.io.IOException;
import java.util.List;
import com.good.neighbor.model.ProductDTO;
import com.good.neighbor.util.PageTest;

public interface ProductService {

  // 0.상품 총 개수 구하기
  public int countProduct() throws IOException;

  // 1.상품 등록
  public void insertProduct(ProductDTO productDTO) throws IOException;

  // 2.상품 목록
  public List<ProductDTO> listProduct(PageTest pageTest) throws IOException;

  // 3.상품 상세
  public ProductDTO detailProduct(int product_id) throws IOException;

  // 4.상품 검색
  public List<ProductDTO> searchProduct(String product_name) throws IOException;

  // 4.상품 수정
  public void updateProduct(ProductDTO productDTO) throws IOException;

  // 5.상품 삭제
  public void deleteProduct(int product_id) throws IOException;

}

