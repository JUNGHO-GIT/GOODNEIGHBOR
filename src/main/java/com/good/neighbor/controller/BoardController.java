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
import com.good.neighbor.model.BoardDTO;
import com.good.neighbor.util.PageTest;

@Controller
@RequestMapping("/board")
public class BoardController {

  // 0. auto-wired session factory ---------------------------------------------------------------->
  @Autowired
  private SqlSession sqlSession;

  // 1-1. insertForm() --------------------------------------------------------------------------->
  @RequestMapping(value = "/insertForm.do", method = RequestMethod.GET)
  public String insertForm(Model model, HttpServletRequest request) {

    String board_number_param = request.getParameter("board_number");
    String board_group_param = request.getParameter("board_group");
    String board_step_param = request.getParameter("board_step");
    String board_level_param = request.getParameter("board_level");
    String board_pw_param = request.getParameter("board_pw");
    String pageNum = request.getParameter("pageNum");

    Integer board_number = (board_number_param != null && !board_number_param.isEmpty()) ? Integer.parseInt(board_number_param) : 0;
    Integer board_group = (board_group_param != null && !board_group_param.isEmpty()) ? Integer.parseInt(board_group_param) : 1;
    Integer board_step = (board_step_param != null && !board_step_param.isEmpty()) ? Integer.parseInt(board_step_param) : 0;
    Integer board_level = (board_level_param != null && !board_level_param.isEmpty()) ? Integer.parseInt(board_level_param) : 0;
    Integer board_pw = (board_pw_param != null && !board_pw_param.isEmpty()) ? Integer.parseInt(board_pw_param) : 0;

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("board_number", board_number);
    model.addAttribute("board_group", board_group);
    model.addAttribute("board_step", board_step);
    model.addAttribute("board_level", board_level);
    model.addAttribute("board_pw", board_pw);

    return "board/insertForm";
  }


  // 1-2. insertPro() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/insertPro.do", method = RequestMethod.POST)
  public String insertPro(@ModelAttribute("boardDTO") BoardDTO boardDTO, HttpServletRequest request)
  throws Exception {

    int maxNum = 0;

    if (sqlSession.selectOne("board.getMax") != null) {
      maxNum = sqlSession.selectOne("board.getMax");
    }
    if (maxNum != 0) {
      maxNum = maxNum + 1;
    } else {
      maxNum = 1;
    }

    if (boardDTO.getBoard_number() != 0 || boardDTO.getBoard_number() != null) {
      sqlSession.update("board.getUpdateStep", boardDTO);
      boardDTO.setBoard_step(boardDTO.getBoard_step() + 1);
      boardDTO.setBoard_level(boardDTO.getBoard_level() + 1);
    }
    else {
      boardDTO.setBoard_group(maxNum);
      boardDTO.setBoard_number(maxNum);
      boardDTO.setBoard_step(0);
      boardDTO.setBoard_level(0);
    }
    sqlSession.insert("board.getInsert", boardDTO);

    return "redirect:/board/list.do";
  }

  // 2-1. listBoard() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/list.do", method = RequestMethod.GET)
  public String listBoard(@ModelAttribute("boardDTO") BoardDTO boardDTO,
  @RequestParam(value = "pageNum", required = false) String pageNum, Model model,
  HttpServletRequest request) throws Exception {

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
      cnt = sqlSession.selectOne("board.getCount");
    }
    else {
      map3.put("columnParam", keyField);
      map3.put("keyWord", keyWord);
      cnt = sqlSession.selectOne("board.getSearchCount", map3);
    }

    int curPage = Integer.parseInt(pageNum);
    PageTest pt = new PageTest(cnt, curPage);
    int startPos = pt.getStartRow() - 1;

    List<BoardDTO> list = null;

    if (keyWord == null || keyWord.length() < 1 || keyWord == "") {
      map.put("start", new Integer(startPos));
      map.put("count", new Integer(pt.getPageSize()));

      list = sqlSession.selectList("board.getList", map);
    }
    else if (keyWord != null || keyWord.length() > 1) {
      map2.put("columnParam", keyField);
      map2.put("keyWord", keyWord);
      map2.put("start", new Integer(startPos));
      map2.put("count", new Integer(pt.getPageSize()));

      list = sqlSession.selectList("board.getSearch", map2);
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

    return "board/list";
  }

  // 3-1. contentDo() ----------------------------------------------------------------------------->
  @RequestMapping("/content.do")
  public String contentDo(Model model, HttpServletRequest request) {

    String pageNum = request.getParameter("pageNum");

    int num1 = Integer.parseInt(request.getParameter("board_number"));
    sqlSession.update("board.getUpdateCount", num1);

    BoardDTO dto = sqlSession.selectOne("board.getDetails", num1);

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("dto", dto);

    return "board/content";
  }

  // 4-1. updateForm() ---------------------------------------------------------------------------->
  @RequestMapping("/updateForm.do")
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

  // 4-1. updateCheck() --------------------------------------------------------------------------->
  @ResponseBody
  @RequestMapping(value = "/updateCheck.do", method = RequestMethod.POST)
  public Integer updateCheck(HttpServletRequest request, HttpSession session) throws Exception {

    Integer board_number = Integer.parseInt(request.getParameter("board_number"));
    String member_id = (String) session.getAttribute("member_id");
    String pageNum = request.getParameter("pageNum");

    BoardDTO dto = sqlSession.selectOne("board.getDetails", board_number);

    Map<String, Object> map = new HashMap<>();
    map.put("board_number", board_number);
    map.put("board_writer", member_id);
    Integer count = sqlSession.selectOne("board.getUpdateCheck", map);

    ModelAndView mv = new ModelAndView();
    mv.addObject("board_number", board_number);
    mv.addObject("pageNum", pageNum);
    mv.addObject("dto", dto);

    if (count == 1) {
      return 1;
    } else {
      return -1;
    }
  }

  // 4-3. updatePro() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/updatePro.do", method = RequestMethod.POST)
  public ModelAndView updatePro(@ModelAttribute("boardDTO") BoardDTO boardDTO, HttpServletRequest request) throws Exception {

    String pageNum = request.getParameter("pageNum");
    sqlSession.update("board.getUpdate", boardDTO);

    ModelAndView mv = new ModelAndView();
    mv.addObject("pageNum", pageNum);

    mv.setViewName("redirect:/board/list.do");
    return mv;
  }

  // 5-1. deleteCheck() --------------------------------------------------------------------------->
  @ResponseBody
  @RequestMapping(value = "/deleteCheck.do", method = RequestMethod.POST)
  public Integer deleteCheck(HttpServletRequest request) {

    Integer board_number = Integer.parseInt(request.getParameter("board_number"));
    String board_pw = request.getParameter("board_pw");

    Map<String, Object> map = new HashMap<>();
    map.put("board_number", board_number);
    map.put("board_pw", board_pw);

    int count = sqlSession.selectOne("board.getDeleteCheck", map);

    if (count == 1) {
      return 1;
    }
    else {
      return -1;
    }
  }

  // 5-2. deletePro() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/deletePro.do", method = RequestMethod.GET)
  public String deletePro(HttpServletRequest request) {

    Integer board_number = Integer.parseInt(request.getParameter("board_number"));
    String board_pw = request.getParameter("board_pw");

    Map<String, Object> map = new HashMap<>();

    map.put("board_number", board_number);
    map.put("board_pw", board_pw);

    sqlSession.delete("board.getDelete", map);

    return "redirect:/board/list.do";
  }

}