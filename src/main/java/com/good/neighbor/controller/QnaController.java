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
import com.good.neighbor.model.QnaDTO;
import com.good.neighbor.util.PageTest1;

@Controller
@RequestMapping("/qna")
public class QnaController {

  // 0. auto-wired session factory ---------------------------------------------------------------->
  @Autowired
  private SqlSession sqlSession;

  // 1-1. insertForm() ---------------------------------------------------------------------------->
  @RequestMapping(value = "/insertForm.do", method = RequestMethod.GET)
  public String insertForm(Model model, HttpServletRequest request) {

    String qna_number_param = request.getParameter("qna_number");
    String qna_group_param = request.getParameter("qna_group");
    String qna_step_param = request.getParameter("qna_step");
    String qna_level_param = request.getParameter("qna_level");
    String qna_pw_param = request.getParameter("qna_pw");
    String pageNum = request.getParameter("pageNum");

    Integer qna_number = (qna_number_param != null && !qna_number_param.isEmpty()) ? Integer.parseInt(qna_number_param) : 0;
    Integer qna_group = (qna_group_param != null && !qna_group_param.isEmpty()) ? Integer.parseInt(qna_group_param) : 1;
    Integer qna_step = (qna_step_param != null && !qna_step_param.isEmpty()) ? Integer.parseInt(qna_step_param) : 0;
    Integer qna_level = (qna_level_param != null && !qna_level_param.isEmpty()) ? Integer.parseInt(qna_level_param) : 0;
    Integer qna_pw = (qna_pw_param != null && !qna_pw_param.isEmpty()) ? Integer.parseInt(qna_pw_param) : 0;

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("qna_number", qna_number);
    model.addAttribute("qna_group", qna_group);
    model.addAttribute("qna_step", qna_step);
    model.addAttribute("qna_level", qna_level);
    model.addAttribute("qna_pw", qna_pw);

    return "qna/insertForm";
  }

  // 1-2. insertPro() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/insertPro.do", method = RequestMethod.POST)
  public String insertPro (
    @ModelAttribute("qnaDTO") QnaDTO qnaDTO,
    HttpServletRequest request
  ) throws Exception {

    String qna_pw = request.getParameter("qna_pw");

    int maxNum = 0;

    if (sqlSession.selectOne("qna.getMax") != null) {
      maxNum = sqlSession.selectOne("qna.getMax");
    }
    if (maxNum != 0) {
      maxNum = maxNum + 1;
    }
    else {
      maxNum = 1;
    }

    if (qnaDTO.getQna_number() != 0 || qnaDTO.getQna_number() != null) {
      sqlSession.update("qna.getUpdateStep", qnaDTO);
      qnaDTO.setQna_step(qnaDTO.getQna_step() + 1);
      qnaDTO.setQna_level(qnaDTO.getQna_level() + 1);
      qnaDTO.setQna_pw(qna_pw);
    }
    else {
      qnaDTO.setQna_group(maxNum);
      qnaDTO.setQna_number(maxNum);
      qnaDTO.setQna_step(0);
      qnaDTO.setQna_level(0);
    }
    sqlSession.insert("qna.getInsert", qnaDTO);

    return "redirect:/qna/list.do";
  }

  // 2-1. listQna() ------------------------------------------------------------------------------->
  @RequestMapping(value = "/list.do", method = RequestMethod.GET)
  public String listQna(
    @ModelAttribute("qnaDTO") QnaDTO qnaDTO,
    @RequestParam(value = "pageNum", required = false) String pageNum,
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
      cnt = sqlSession.selectOne("qna.getCount");
    }
    else {
      map3.put("columnParam", keyField);
      map3.put("keyWord", keyWord);
      cnt = sqlSession.selectOne("qna.getSearchCount", map3);
    }

    int curPage = Integer.parseInt(pageNum);
    PageTest1 pt = new PageTest1(cnt, curPage);
    int startPos = pt.getStartRow() - 1;

    List<QnaDTO> list = null;

    if (keyWord == null || keyWord.length() < 1 || keyWord == "") {
      map.put("start", new Integer(startPos));
      map.put("count", new Integer(pt.getPageSize()));

      list = sqlSession.selectList("qna.getList", map);
    }
    else if (keyWord != null || keyWord.length() > 1) {
      map2.put("columnParam", keyField);
      map2.put("keyWord", keyWord);
      map2.put("start", new Integer(startPos));
      map2.put("count", new Integer(pt.getPageSize()));

      list = sqlSession.selectList("qna.getSearch", map2);
    }

    if (pt.getEndPage() > pt.getPageCnt()) {
      pt.setEndPage(pt.getPageCnt());
    }

    int number = cnt - (curPage - 1) * pt.getPageSize();

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("number", number);
    model.addAttribute("keyField", keyField);
    model.addAttribute("keyWord", keyWord);
    model.addAttribute("pt", pt);
    model.addAttribute("cnt", cnt);
    model.addAttribute("list", list);

    return "qna/list";
  }


  // 3-1. contentCheck() -------------------------------------------------------------------------->
  @ResponseBody
  @RequestMapping(value = "/contentCheck.do", method = RequestMethod.POST)
  public Integer contentCheck(HttpServletRequest request, HttpSession session) throws Exception {

    Integer qna_number = Integer.parseInt(request.getParameter("qna_number"));
    String qna_pw = request.getParameter("qna_pw");

    QnaDTO dto = sqlSession.selectOne("qna.getDetails", qna_number);

    if (dto.getQna_pw().equals(qna_pw)) {
      return 1;
    }
    else {
      return -1;
    }
  }

  // 3-2. content() ------------------------------------------------------------------------------->
  @RequestMapping(value="/content.do", method=RequestMethod.GET)
  public String content(HttpServletRequest request, Model model) {

    String pageNum = request.getParameter("pageNum");
    Integer qna_number = Integer.parseInt(request.getParameter("qna_number"));

    sqlSession.update("qna.getCount", qna_number);
    QnaDTO dto = sqlSession.selectOne("qna.getDetails", qna_number);

    model.addAttribute("dto", dto);
    model.addAttribute("pageNum", pageNum);

    return "qna/content";
  }

  // 4-1. updateForm() ---------------------------------------------------------------------------->
  @RequestMapping(value = "/updateForm.do", method = RequestMethod.GET)
  public String updateForm(HttpServletRequest request, Model model) {

    String pageNum = request.getParameter("pageNum");
    Integer qna_number = Integer.parseInt(request.getParameter("qna_number"));
    QnaDTO dto = sqlSession.selectOne("qna.getDetails", qna_number);

    model.addAttribute("dto", dto);
    model.addAttribute("pageNum", pageNum);

    return "qna/updateForm";
  }

  // 4-1. updateCheck() --------------------------------------------------------------------------->
  @ResponseBody
  @RequestMapping(value = "/updateCheck.do", method = RequestMethod.POST)
  public Integer updateCheck(HttpServletRequest request, HttpSession session) throws Exception {

    Integer qna_number = Integer.parseInt(request.getParameter("qna_number"));
    String member_id = (String) session.getAttribute("member_id");
    String pageNum = request.getParameter("pageNum");

    QnaDTO dto = sqlSession.selectOne("qna.getDetails", qna_number);

    Map<String, Object> map = new HashMap<>();
    map.put("qna_number", qna_number);
    map.put("qna_writer", member_id);

    Integer count = sqlSession.selectOne("qna.getUpdateCheck", map);

    ModelAndView mv = new ModelAndView();
    mv.addObject("qna_number", qna_number);
    mv.addObject("pageNum", pageNum);
    mv.addObject("dto", dto);

    if (count == 1) {
      return 1;
    } else {
      return -1;
    }
  }

  // 4-2. updatePro() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/updatePro.do", method = RequestMethod.POST)
  public String updatePro(HttpServletRequest request, QnaDTO qnaDTO, Model model) {

    String pw = request.getParameter("qna_pw");

    sqlSession.update("qna.getUpdate", qnaDTO);

    model.addAttribute("qna_pw", pw);
    model.addAttribute("qnaDTO", qnaDTO);

    return "redirect:/qna/list.do";
  }

  // 5-2. deleteCheck() --------------------------------------------------------------------------->
  @ResponseBody
  @RequestMapping(value = "/deleteCheck.do", method = RequestMethod.POST)
  public Integer deleteCheck(HttpServletRequest request) {

    Integer qna_number = Integer.parseInt(request.getParameter("qna_number"));
    String qna_pw = request.getParameter("qna_pw");

    Map<String, Object> map = new HashMap<>();
    map.put("qna_number", qna_number);
    map.put("qna_pw", qna_pw);

    int count = sqlSession.selectOne("qna.getDeleteCheck", map);

    if (count == 1) {



      return 1;
    }
    else {
      return -1;
    }
  }

  // 5-3. deletePro() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/deletePro.do", method = RequestMethod.GET)
  public String deletePro(HttpServletRequest request) {

    Integer qna_number = Integer.parseInt(request.getParameter("qna_number"));
    String qna_pw = request.getParameter("qna_pw");

    Map<String, Object> map = new HashMap<>();

    map.put("qna_number", qna_number);
    map.put("qna_pw", qna_pw);

    sqlSession.delete("qna.getDelete", map);

    return "redirect:/qna/list.do";
  }
}