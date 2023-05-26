package com.good.neighbor.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import com.good.neighbor.model.ProductDTO;
import com.good.neighbor.util.PageTest;

@Controller
@RequestMapping("/product")
public class ProductController {

  // 0. auto-wired session factory ---------------------------------------------------------------->
  @Autowired
  private SqlSession sqlSession;

  // 로그 변수 설정
  private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

  /**
  private Integer product_number;
  private String product_name;
  private String product_detail;
  private String product_price;
  private String product_stock;
  private String product_company;
  private Integer product_readcount;
	private Integer product_group;
	private Integer product_step;
	private Integer product_level;
  private String product_image;
  private Timestamp product_regdate;
  **/

  // 1. insertForm -------------------------------------------------------------------------------->
  @RequestMapping(value = "/insertForm", method = RequestMethod.GET)
  public String insertForm(Model model) throws Exception {
    try {
      model.addAttribute("productDTO", new ProductDTO());
    }
    catch (Exception e) {
      logger.error(e.getMessage());
    }
    return "product/insertForm";
  }


  // 2. insertPro --------------------------------------------------------------------------------->
  @RequestMapping(value = "/insertPro", method = RequestMethod.POST)
  public String insertPro (
    @RequestParam("product_image") MultipartFile multipartFile,
    ProductDTO productDTO,
    HttpServletRequest request
  ) throws Exception {

    // 1. 파일 이름 변경
    UUID uuid = UUID.randomUUID();
    String saveName = uuid + "_" + multipartFile.getOriginalFilename();
    productDTO.setProduct_image(saveName);

    // 2. 파일 저장 경로 설정
    String savePath = null;
    savePath = request.getSession().getServletContext().getRealPath("resources/upload");

    // 3. 저장할 File 객체를 생성
    File saveFile = new File(savePath, saveName);

    // 4. 업로드한 파일을 저장
    try {
      multipartFile.transferTo(saveFile);
    } catch (Exception e) {
      logger.error(e.getMessage());
    }

    // 5. DB에 저장
    sqlSession.insert("productMapper.insertPro", productDTO);

    return "redirect:/product/list";
  }

  // 3. list -------------------------------------------------------------------------------------->



  // 4. content ----------------------------------------------------------------------------------->



  // 5. updateForm -------------------------------------------------------------------------------->


  // 6. updatePro --------------------------------------------------------------------------------->



  // 7. deleteForm -------------------------------------------------------------------------------->


  // 8. deletePro --------------------------------------------------------------------------------->

}