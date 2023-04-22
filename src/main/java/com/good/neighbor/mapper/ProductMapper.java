package com.good.neighbor.mapper;

import java.io.IOException;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.good.neighbor.model.PaginationDTO;
import com.good.neighbor.model.ProductDTO;

@Mapper
public interface ProductMapper {

	// 0.전체 상품 수
	public int totalProduct() throws IOException;

  // 1.상품 등록
  public void insertProduct(ProductDTO productDTO) throws IOException;

  // 2.상품 목록
	public List<ProductDTO> listProduct(PaginationDTO paginationDTO) throws IOException;

  // 3.상품 상세
  public ProductDTO detailProduct(int product_id) throws IOException;

  // 4.상품 검색
  public List<ProductDTO> searchProduct(String product_name) throws IOException;

  // 4.상품 수정
  public void updateProduct(ProductDTO productDTO) throws IOException;

  // 5.상품 삭제
  public void deleteProduct(int product_id) throws IOException;

}