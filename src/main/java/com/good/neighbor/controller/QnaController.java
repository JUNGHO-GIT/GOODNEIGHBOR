package com.good.neighbor.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.good.neighbor.model.QnaDTO;
import com.good.neighbor.util.PageTest;

@Controller
@RequestMapping("/qna")
public class QnaController {

  // 0. auto-wired session factory ---------------------------------------------------------------->
  @Autowired
  private SqlSession sqlSession;

  // 1-1. insertForm() ---------------------------------------------------------------------------->
  @RequestMapping(value = "/insertForm.do", method = RequestMethod.GET)
  public String insertForm(Model model, HttpServletRequest request) {
    String qna_number = request.getParameter("qna_number");
    String qna_group = request.getParameter("qna_group");
    String qna_step = request.getParameter("qna_step");
    String qna_level = request.getParameter("qna_level");
    String pageNum = request.getParameter("pageNum");
    String qna_pw = request.getParameter("qna_pw");

    if (qna_number == null) {
      qna_number = "0";
      qna_group = "1";
      qna_step = "0";
      qna_level = "0";
    }

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

    if (qnaDTO.getQna_number() != 0) {

      sqlSession.update("qna.getUpdateStep", qnaDTO);

      qnaDTO.setQna_step(qnaDTO.getQna_step() + 1);
      qnaDTO.setQna_level(qnaDTO.getQna_level() + 1);
      qnaDTO.setQna_pw(qna_pw);
    }
    else {
      qnaDTO.setQna_group(maxNum);
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
    PageTest pt = new PageTest(cnt, curPage);
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

  // 3-1. content() ------------------------------------------------------------------------------->
  @RequestMapping(value="/content.do", method=RequestMethod.GET)
  public String content(HttpServletRequest request, Model model) {

    String pageNum = request.getParameter("pageNum");
    int num = Integer.parseInt(request.getParameter("qna_number"));

    sqlSession.update("qna.getCount", num);

    QnaDTO dto = sqlSession.selectOne("qna.getDetails", num);
    model.addAttribute("dto", dto);
    model.addAttribute("pageNum", pageNum);

    return "qna/content";
  }

  // 4-1. getUpdate() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/getUpdate.do", method = RequestMethod.GET)
  public String getUpdate(HttpServletRequest request, Model model) {

    String pageNum = request.getParameter("pageNum");
    int num = Integer.parseInt(request.getParameter("qna_number"));
    QnaDTO dto = sqlSession.selectOne("qna.getDetails", num);

    model.addAttribute("dto", dto);
    model.addAttribute("pageNum", pageNum);

    return "qna/updateForm";
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

  // 5-1. deleteForm() ---------------------------------------------------------------------------->
  @RequestMapping(value = "/deleteForm.do", method = RequestMethod.GET)
  public String deleteForm(HttpServletRequest request, Model model) {

    String pageNum = request.getParameter("pageNum");
    int num = Integer.parseInt(request.getParameter("qna_number"));
    QnaDTO dto = sqlSession.selectOne("qna.getDetails", num);

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("dto", dto);

    return "qna/deleteForm";
  }

  // 5-2. deletePro() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/deletePro.do", method = RequestMethod.POST)
  public String deletePro(HttpServletRequest request, Model model) {

    int num = Integer.parseInt(request.getParameter("qna_number"));
    String pageNum = request.getParameter("pageNum");

    QnaDTO dto = sqlSession.selectOne("qna.getDetails", num);
    sqlSession.delete("qna.getDelete", num);

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("dto", dto);

    return "redirect:/qna/list.do";
  }

  // 6-1. secretForm() ---------------------------------------------------------------------------->
  @RequestMapping(value = "/secretForm.do", method = RequestMethod.GET)
  public String secretForm(HttpServletRequest request, Model model) {

    int num = Integer.parseInt(request.getParameter("qna_number"));
    String pageNum = request.getParameter("pageNum");
    QnaDTO dto = sqlSession.selectOne("qna.getDetails", num);

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("dto", dto);
    model.addAttribute("num", num);

    return "qna/secretForm";
  }

}
