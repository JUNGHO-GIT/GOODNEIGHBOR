package com.good.neighbor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.good.neighbor.model.ProductDTO;
import com.good.neighbor.util.PageTest2;

@Controller
@RequestMapping("/product")
public class ProductController {

  // 0. auto-wired session factory ---------------------------------------------------------------->
  @Autowired
  private SqlSession sqlSession;

  // 1. insertForm -------------------------------------------------------------------------------->
  @RequestMapping(value = "/insertForm.do", method = RequestMethod.GET)
  public String insertForm(Model model, HttpServletRequest request) {

    String product_number_param = request.getParameter("product_number");
    String product_group_param = request.getParameter("product_group");
    String product_step_param = request.getParameter("product_step");
    String product_level_param = request.getParameter("product_level");
    String pageNum = request.getParameter("pageNum");

    Integer product_number = (product_number_param != null && !product_number_param.isEmpty()) ? Integer.parseInt(product_number_param) : 0;
    Integer product_group = (product_group_param != null && !product_group_param.isEmpty()) ? Integer.parseInt(product_group_param) : 1;
    Integer product_step = (product_step_param != null && !product_step_param.isEmpty()) ? Integer.parseInt(product_step_param) : 0;
    Integer product_level = (product_level_param != null && !product_level_param.isEmpty()) ? Integer.parseInt(product_level_param) : 0;

    ProductDTO dto = sqlSession.selectOne("product.getDetails", product_number);

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("product_number", product_number);
    model.addAttribute("product_group", product_group);
    model.addAttribute("product_step", product_step);
    model.addAttribute("product_level", product_level);

    model.addAttribute("dto", dto);

    return "product/insertForm";
  }

  // 1-2. insertPro() ----------------------------------------------------------------------------->
	@RequestMapping(value = "/insertPro.do", method = RequestMethod.POST)
  public String insertPro (@ModelAttribute("productDTO") ProductDTO productDTO, HttpServletRequest request) throws Exception {

    int maxNum = 0;

    if (sqlSession.selectOne("product.getMax") != null) {
      maxNum = sqlSession.selectOne("product.getMax");
    }
    if (maxNum != 0) {
      maxNum = maxNum + 1;
    }
    else {
      maxNum = 1;
    }

    if (productDTO.getProduct_number() == 0 || productDTO.getProduct_number() == null) {
      productDTO.setProduct_group(maxNum);
      productDTO.setProduct_number(maxNum);
      productDTO.setProduct_step(0);
      productDTO.setProduct_level(0);
    }
    else if (productDTO.getProduct_number() != 0 || productDTO.getProduct_number() != null) {
      sqlSession.update("product.getUpdateStep", productDTO);
      productDTO.setProduct_step(productDTO.getProduct_step() + 1);
      productDTO.setProduct_level(productDTO.getProduct_level() + 1);
    }
    else {
      productDTO.setProduct_group(maxNum);
      productDTO.setProduct_number(maxNum);
      productDTO.setProduct_step(0);
      productDTO.setProduct_level(0);
    }
    sqlSession.insert("product.getInsert", productDTO);

    return "redirect:/product/list.do";
  }

  // 3. listProduct() ----------------------------------------------------------------------------->
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
  public String listProduct(
    @ModelAttribute("productDTO") ProductDTO productDTO,
    @RequestParam(value="pageNum", required = false) String pageNum,
    Model model, HttpServletRequest request
  ) throws Exception {

    String keyWord = "";
    String keyField = "";
    int cnt = 0;

    if (request.getParameter("keyWord") != null) {
      keyWord = request.getParameter("keyWord");
      keyField = request.getParameter("keyField");
    } else {
      keyWord = "";
      keyField = "";
    }
    if (pageNum == null) {
      pageNum = "1";
    }
    Map<String, Object> map = new HashMap<>();
    Map<String, Object> map2 = new HashMap<>();
    Map<String, Object> map3 = new HashMap<>();

    if (keyWord == null || keyWord.length() < 1 || keyWord == "") {
      cnt = sqlSession.selectOne("product.getCount");
    }
    else {
      map3.put("columnParam", keyField);
      map3.put("keyWord", keyWord);
      cnt = sqlSession.selectOne("product.getSearchCount", map3);
    }

    int curPage = Integer.parseInt(pageNum);
    PageTest2 pt = new PageTest2(cnt, curPage);
    int startPos = pt.getStartRow() - 1;

    List<ProductDTO> list = null;

    if (keyWord == null || keyWord.length() < 1 || keyWord == "") {
      map.put("start", new Integer(startPos));
      map.put("count", new Integer(pt.getPageSize()));

      list = sqlSession.selectList("product.getList", map);
    }
    else if (keyWord != null || keyWord.length() > 1) {
      map2.put("columnParam", keyField);
      map2.put("keyWord", keyWord);
      map2.put("start", new Integer(startPos));
      map2.put("count", new Integer(pt.getPageSize()));

      list = sqlSession.selectList("product.getSearch", map2);
    }

    if (pt.getEndPage() > pt.getPageCnt()) {
      pt.setEndPage(pt.getPageCnt());
    }

    int number = cnt - (curPage - 1) * pt.getPageSize();

    model.addAttribute("number", number);
    model.addAttribute("pageNum", pageNum);
    model.addAttribute("keyField", keyField);
    model.addAttribute("keyWord", keyWord);
    model.addAttribute("pt", pt);
    model.addAttribute("cnt", cnt);
    model.addAttribute("list", list);

    return "product/list";
  }

  // 4-1. content() ------------------------------------------------------------------------------->
	@RequestMapping(value="/content.do", method=RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("product_number"));
		sqlSession.update("product.getUpdateCount", num);

		ProductDTO dto = sqlSession.selectOne("product.getDetails", num);
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);

		return "product/content";
	}

  // 5-1. updateForm() --------------------------------------------------------------------------->
	@RequestMapping(value="/updateForm.do", method=RequestMethod.GET)
	public String updateForm(HttpServletRequest request,Model model) {

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("product_number"));

		ProductDTO dto = sqlSession.selectOne("product.getDetails", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", dto);

		return "product/updateForm";
	}

  // 4-1. updateCheck() --------------------------------------------------------------------------->
  @ResponseBody
  @RequestMapping(value = "/updateCheck.do", method = RequestMethod.POST)
  public Integer updateCheck(HttpServletRequest request, HttpSession session) throws Exception {

    Integer product_number = Integer.parseInt(request.getParameter("product_number"));
    String admin_id = (String) session.getAttribute("admin_id");
    String pageNum = request.getParameter("pageNum");

    ProductDTO dto = sqlSession.selectOne("product.getDetails", product_number);

    Map<String, Object> map = new HashMap<>();
    map.put("product_number", product_number);
    map.put("admin_id", admin_id);
    Integer count = sqlSession.selectOne("product.getUpdateCheck", map);

    ModelAndView mv = new ModelAndView();
    mv.addObject("product_number", product_number);
    mv.addObject("admin_id", admin_id);
    mv.addObject("pageNum", pageNum);
    mv.addObject("dto", dto);

    if (count == 1) {
      return 1;
    } else {
      return -1;
    }
  }

  // 5-2. updatePro() ----------------------------------------------------------------------------->
	@RequestMapping(value = "/updatePro.do", method = RequestMethod.POST)
  public String updatePro(HttpServletRequest request, ProductDTO productDTO, Model model, HttpSession session) throws Exception {

    String admin_id = (String) session.getAttribute("admin_id");

    sqlSession.update("product.getUpdate", productDTO);

    model.addAttribute("admin_id", admin_id);
    model.addAttribute("productDTO", productDTO);

    return "redirect:/product/list.do";
  }

  // 6-2. deleteCheck() --------------------------------------------------------------------------->
  @ResponseBody
  @RequestMapping(value = "/deleteCheck.do", method = RequestMethod.POST)
  public Integer deleteCheck(HttpServletRequest request, HttpSession session) throws Exception {

    Integer product_number = Integer.parseInt(request.getParameter("product_number"));
    String admin_id = (String) session.getAttribute("admin_id");

    Map<String, Object> map = new HashMap<>();
    map.put("product_number", product_number);
    map.put("admin_id", admin_id);

    int count = sqlSession.selectOne("product.getDeleteCheck", map);

    if (count == 1) {
      return 1;
    }
    else {
      return -1;
    }
  }

  // 6-1. deletePro() ---------------------------------------------------------------------------->
	@RequestMapping(value="/deletePro.do", method=RequestMethod.GET)
	public String deletePro(HttpServletRequest request, Model model) {

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("product_number"));

		sqlSession.delete("product.getDelete", num);

		model.addAttribute("pageNum", pageNum);

		return "redirect:/product/list.do";
	}

}