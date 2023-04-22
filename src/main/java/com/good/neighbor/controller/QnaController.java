package com.good.neighbor.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
  @RequestMapping(value="/insertForm.do", method=RequestMethod.GET)
  public String insertForm(Model model,HttpServletRequest request) {

    String qna_number=request.getParameter("qna_number");
    String qna_ref=request.getParameter("qna_ref");
    String qna_step=request.getParameter("qna_step");
    String qna_level=request.getParameter("qna_level");
    String pageNum = request.getParameter("pageNum");
    String qna_pw=request.getParameter("qna_pw");

    if(qna_number == null) {
      qna_number = "0";
      qna_ref = "1";
      qna_step = "0";
      qna_level = "0";
    }

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("qna_number", qna_number);
    model.addAttribute("qna_ref", qna_ref);
    model.addAttribute("qna_step", qna_step);
    model.addAttribute("qna_level", qna_level);
    model.addAttribute("qna_pw", qna_pw);

    return "qna/insertForm";
  }

  // 1-2. insertPro() ----------------------------------------------------------------------------->
  @RequestMapping(value="/insertPro.do", method=RequestMethod.POST)
  public String insertPro(HttpServletRequest request, QnaDTO qnaDTO) {

    String qna_pw = request.getParameter("qna_pw");
    int maxNum = 0;

    if(sqlSession.selectOne("qna.qnaMax") != null) {
      maxNum = sqlSession.selectOne("qna.qnaMax");
    }
    if(maxNum != 0) {
      maxNum = maxNum + 1;
    }
    else {
      maxNum = 1;
    }

    if(qnaDTO.getQna_number() != 0) {
      sqlSession.update("qna.Step", qnaDTO);
      qnaDTO.setQna_step(qnaDTO.getQna_step() + 1);
      qnaDTO.setQna_level(qnaDTO.getQna_level() + 1);
      qnaDTO.setQna_pw(qna_pw);
    }
    else {
      qnaDTO.setQna_ref(maxNum);
      qnaDTO.setQna_step(0);
      qnaDTO.setQna_level(0);
    }
    sqlSession.insert("qna.insertQna", qnaDTO);

    return "redirect:/qna/list.do";
  }

  // 2-1. listQna() ----------------------------------------------------------------------------->
  @RequestMapping("list.do")
  public String listQna (
    @RequestParam(value="pageNum",required=false) String pageNum,
    HttpServletRequest request,
    QnaDTO qnaDTO, Model model
  ) {

    if(pageNum == null) {
      pageNum = "1";
    }
    int cnt = sqlSession.selectOne("qna.countQna");
    int curPage=Integer.parseInt(pageNum);

    PageTest pt = new PageTest(cnt,curPage);

    int startline=pt.getStartRow() - 1;

    Map<String, Object> map = new HashMap<>();
    map.put("start", startline);
    map.put("count", pt.getPageSize());

    List<QnaDTO> list = sqlSession.selectList("qna.listQna",map);

    if(pt.getEndPage()>pt.getPageCnt()) {
      pt.setEndPage(pt.getPageCnt());
    }
    int number = cnt-(curPage - 1)*pt.getPageSize();

    model.addAttribute("number", number);
    model.addAttribute("pageNum", pageNum);
    model.addAttribute("pt", pt);
    model.addAttribute("cnt", cnt);
    model.addAttribute("list",list);

    return "qna/list";
  }

  // 3-1. content() ------------------------------------------------------------------------------->
  @RequestMapping("content.do")
  public String content(HttpServletRequest request,Model model) {

    String pageNum = request.getParameter("pageNum");
    int num = Integer.parseInt(request.getParameter("qna_number"));

    sqlSession.update("qna.cntQna", num);

    QnaDTO dto = sqlSession.selectOne("qna.oneSelect", num);
    model.addAttribute("dto", dto);
    model.addAttribute("pageNum", pageNum);

    return "qna/content";
  }

  // 4-1. editForm() ------------------------------------------------------------------------------>
  @RequestMapping("editForm.do")
  public String editForm(HttpServletRequest request, Model model) {

    String pageNum = request.getParameter("pageNum");
    int num = Integer.parseInt(request.getParameter("qna_number"));
    QnaDTO dto = sqlSession.selectOne("qna.oneSelect", num);

    model.addAttribute("dto", dto);
    model.addAttribute("pageNum", pageNum);

    return "qna/editForm";
  }

  // 4-2. editPro() ------------------------------------------------------------------------------->
  @RequestMapping(value="editPro.do", method=RequestMethod.POST)
  public String editPro(HttpServletRequest request, QnaDTO qnaDTO,Model model) {

    String pw=request.getParameter("qna_pw");

    sqlSession.update("qna.updateQna", qnaDTO);

    model.addAttribute("qna_pw", pw);
    model.addAttribute("qnaDTO", qnaDTO);

    return "redirect:/qna/list.do";
  }

  // 5-1. deleteForm() ---------------------------------------------------------------------------->
  @RequestMapping("deleteForm.do")
  public String deleteForm(HttpServletRequest request, Model model) {

    String pageNum = request.getParameter("pageNum");
    int num = Integer.parseInt(request.getParameter("qna_number"));
    QnaDTO dto = sqlSession.selectOne("qna.oneSelect", num);

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("dto", dto);

    return "qna/deleteForm";
  }

  // 5-2. deletePro() ----------------------------------------------------------------------------->
  @RequestMapping(value="deletePro.do", method=RequestMethod.POST)
  public String deletePro(HttpServletRequest request, Model model) {

    int num = Integer.parseInt(request.getParameter("qna_number"));
    String pageNum = request.getParameter("pageNum");

    QnaDTO dto = sqlSession.selectOne("qna.oneSelect", num);
    sqlSession.delete("qna.deleteQna", num);

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("dto", dto);

    return "redirect:/qna/list.do";
  }

  // 6-1. secretForm() ---------------------------------------------------------------------------->
  @RequestMapping(value="secretForm.do", method = RequestMethod.GET)
  public String secretForm(HttpServletRequest request, Model model) {

   int num = Integer.parseInt(request.getParameter("qna_number"));
   String pageNum = request.getParameter("pageNum");
   QnaDTO dto = sqlSession.selectOne("qna.oneSelect", num);

   model.addAttribute("pageNum", pageNum);
   model.addAttribute("dto", dto);
   model.addAttribute("num", num);

   return "qna/secretForm";
  }

}