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
import org.springframework.web.servlet.ModelAndView;
import com.good.neighbor.model.BoardDTO;
import com.good.neighbor.util.PageTest;

@Controller
@RequestMapping("/board")
public class BoardController {

  // 0. auto-wired session factory ---------------------------------------------------------------->
  @Autowired
  private SqlSession sqlSession;

  // 1-1. writeForm() ----------------------------------------------------------------------------->
  @RequestMapping(value="writeForm.do", method=RequestMethod.GET)
  public String writeForm (Model model, HttpServletRequest request) {

    String board_number=request.getParameter("board_number");
    String board_ref=request.getParameter("board_ref");
    String board_step=request.getParameter("board_step");
    String board_level=request.getParameter("board_level");
    String pageNum = request.getParameter("pageNum");

    if(board_number == null) {
      board_number = "0";
      board_ref = "1";
      board_step = "0";
      board_level = "0";
    }
    else {
      board_number=request.getParameter("board_number");
      board_ref=request.getParameter("board_ref");
      board_step=request.getParameter("board_step");
      board_level=request.getParameter("board_level");
    }

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("board_number", board_number);
    model.addAttribute("board_ref", board_ref);
    model.addAttribute("board_step", board_step);
    model.addAttribute("board_level", board_level);

    return "board/writeForm";
  }

  // 1-2. writePro() ------------------------------------------------------------------------------>
  @RequestMapping(value="writePro.do", method=RequestMethod.POST)
  public String writePro (
    @ModelAttribute("boardDTO") BoardDTO boardDTO,
    HttpServletRequest request
  ) throws Exception {

    int maxNum = 0;

    if(sqlSession.selectOne("board.getMax") != null) {
      maxNum = sqlSession.selectOne("board.getMax");
    }
    if(maxNum != 0) {
      maxNum = maxNum + 1;
    }
    else {
      maxNum = 1;
    }

    String ip = request.getRemoteAddr();
    boardDTO.setBoard_ip(ip);

    if(boardDTO.getBoard_number() != 0) {

      sqlSession.update("board.reStep", boardDTO);
      boardDTO.setBoard_step(boardDTO.getBoard_step() + 1);
      boardDTO.setBoard_level(boardDTO.getBoard_level() + 1);

      System.out.println("_level = " + boardDTO.getBoard_level());
    }
    else {
      boardDTO.setBoard_ref(maxNum);
      boardDTO.setBoard_step(0);
      boardDTO.setBoard_level(0);
    }
    sqlSession.insert("board.getInsert", boardDTO);

    return "redirect:/board/list.do";
  }

  // 2-1. listBoard() ----------------------------------------------------------------------------->
  @RequestMapping(value="list.do", method=RequestMethod.GET)
  public String listBoard (
    @ModelAttribute("boardDTO") BoardDTO boardDTO,
    @RequestParam(value="pageNum",required = false) String pageNum,
    Model model,
    HttpServletRequest request
  ) throws Exception {

    String keyWord = "";
    String keyField = "";
    int cnt = 0;


    if(request.getParameter("keyWord") != null) {
      keyWord=request.getParameter("keyWord");
      keyField=request.getParameter("keyField");
    }
    else {
      keyWord = "";
      keyField = "";
    }
    if(pageNum == null) {
      pageNum = "1";
    }

    Map<String, Object> map = new HashMap<>();
    Map<String, Object> map2 = new HashMap<>();
    Map<String, Object> map3 = new HashMap<>();

    if(keyWord == null || keyWord.length()<1 || keyWord == "") {
      cnt = sqlSession.selectOne("board.getCount");
    }
    else {
      map3.put("columnParam", keyField);
      map3.put("keyWord", keyWord);
      cnt = sqlSession.selectOne("board.getSearchCount", map3);
    }

    int curPage = Integer.parseInt(pageNum);
    PageTest pt = new PageTest(cnt,curPage);
    int startPos = pt.getStartRow() - 1;

    List<BoardDTO> list = null;

    if(keyWord == null || keyWord.length() < 1 || keyWord == "") {
      map.put("start", new Integer(startPos));
      map.put("count", new Integer(pt.getPageSize()));

      list = sqlSession.selectList("board.getList", map);
    }
    else if(keyWord != null || keyWord.length() > 1){
      map2.put("columnParam", keyField);
      map2.put("keyWord", keyWord);
      map2.put("start", new Integer(startPos));
      map2.put("count", new Integer(pt.getPageSize()));

      list = sqlSession.selectList("board.getSearch", map2);
    }

    if(pt.getEndPage()>pt.getPageCnt()) {
      pt.setEndPage(pt.getPageCnt());
    }
    int number = cnt-(curPage - 1)*pt.getPageSize();

    model.addAttribute("number", number);
    model.addAttribute("pageNum", pageNum);
    model.addAttribute("keyField", keyField);
    model.addAttribute("keyWord", keyWord);
    model.addAttribute("pt", pt);
    model.addAttribute("cnt", cnt);
    model.addAttribute("list", list);

    return "board/list";
  }

  // 3-1. contentDo() ----------------------------------------------------------------------------->
  @RequestMapping("content.do")
  public String contentDo(Model model,HttpServletRequest request) {

    String pageNum = request.getParameter("pageNum");

    int num1=Integer.parseInt(request.getParameter("board_number"));
    sqlSession.update("board.getUpdateCount", num1);

    BoardDTO dto = sqlSession.selectOne("board.getDetails", num1);

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("dto", dto);

    return "board/content";
  }

  // 4-1. updateForm() ---------------------------------------------------------------------------->
  @RequestMapping("updateForm.do")
  public ModelAndView updateForm(HttpServletRequest request) {

    String pageNum = request.getParameter("pageNum");
    int board_number = Integer.parseInt(request.getParameter("board_number"));
    BoardDTO dto = sqlSession.selectOne("board.getDetails", board_number);

    ModelAndView mv = new ModelAndView();
    mv.addObject("board_number", board_number);
    mv.addObject("pageNum", pageNum);
    mv.addObject("dto", dto);

    mv.setViewName("board/updateForm");
    return mv;
  }

  // 4-2. updatePro() ----------------------------------------------------------------------------->
  @RequestMapping(value="updatePro.do", method=RequestMethod.POST)
  public ModelAndView updatePro (
    @ModelAttribute("boardDTO") BoardDTO boardDTO,
    HttpServletRequest request
  ) throws Exception {

    String pageNum = request.getParameter("pageNum");
    sqlSession.update("board.getModify", boardDTO);

    ModelAndView mv = new ModelAndView();
    mv.addObject("pageNum", pageNum);

    mv.setViewName("redirect:/board/list.do");
    return mv;
  }

  // 5-1. deletePro() ----------------------------------------------------------------------------->
  @RequestMapping(value="deletePro.do", method=RequestMethod.GET)
  public String deletePro(Model model, String board_number, String pageNum) {

    sqlSession.delete("board.getDelete", board_number);

    model.addAttribute("pageNum", pageNum);

    return "redirect:/board/list.do";
  }

  // 5-2. deletePro() ----------------------------------------------------------------------------->
  @RequestMapping(value="deletePro.do", method=RequestMethod.POST)
  public String deletePro (HttpServletRequest request) {

    String board_pw = request.getParameter("board_pw");

    Map<String , String> map = new HashMap<>();

    map.put("board_pw", board_pw);

    sqlSession.delete("board.getDelete", map);
    return "redirect:/board/list.do";
  }

}