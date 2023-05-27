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
import com.good.neighbor.model.NoticeDTO;
import com.good.neighbor.util.PageTest;

@Controller
@RequestMapping("/notice")
public class NoticeController {

  // 0. auto-wired session factory ---------------------------------------------------------------->
	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/insertForm.do")
	public String insertForm() {
		return "notice/insertForm";
	}

  // 1-1. insertForm() --------------------------------------------------------------------------->
  @RequestMapping(value = "/insertForm.do", method = RequestMethod.GET)
  public String insertForm(Model model, HttpServletRequest request) {

    String notice_number_param = request.getParameter("notice_number");
    String notice_group_param = request.getParameter("notice_group");
    String notice_step_param = request.getParameter("notice_step");
    String notice_level_param = request.getParameter("notice_level");
    String notice_pw_param = request.getParameter("notice_pw");
    String pageNum = request.getParameter("pageNum");

    Integer notice_number = (notice_number_param != null && !notice_number_param.isEmpty()) ? Integer.parseInt(notice_number_param) : 0;
    Integer notice_group = (notice_group_param != null && !notice_group_param.isEmpty()) ? Integer.parseInt(notice_group_param) : 1;
    Integer notice_step = (notice_step_param != null && !notice_step_param.isEmpty()) ? Integer.parseInt(notice_step_param) : 0;
    Integer notice_level = (notice_level_param != null && !notice_level_param.isEmpty()) ? Integer.parseInt(notice_level_param) : 0;
    Integer notice_pw = (notice_pw_param != null && !notice_pw_param.isEmpty()) ? Integer.parseInt(notice_pw_param) : 0;

    model.addAttribute("pageNum", pageNum);
    model.addAttribute("notice_number", notice_number);
    model.addAttribute("notice_group", notice_group);
    model.addAttribute("notice_step", notice_step);
    model.addAttribute("notice_level", notice_level);
    model.addAttribute("notice_pw", notice_pw);

    return "notice/insertForm";
  }

  // 1-2. insertPro() ----------------------------------------------------------------------------->
	@RequestMapping(value = "/insertPro.do", method = RequestMethod.POST)
  public String insertPro (
    @ModelAttribute("noticeDTO") NoticeDTO noticeDTO,
    HttpServletRequest request
  ) throws Exception {

    int maxNum = 0;

    if (sqlSession.selectOne("notice.getMax") != null) {
      maxNum = sqlSession.selectOne("notice.getMax");
    }
    if (maxNum != 0) {
      maxNum = maxNum + 1;
    }
    else {
      maxNum = 1;
    }

    if (noticeDTO.getNotice_number() == 0 || noticeDTO.getNotice_number() == null) {
      noticeDTO.setNotice_group(maxNum);
      noticeDTO.setNotice_number(maxNum);
      noticeDTO.setNotice_step(0);
      noticeDTO.setNotice_level(0);
    }
    else if (noticeDTO.getNotice_number() != 0 || noticeDTO.getNotice_number() != null) {
      sqlSession.update("notice.getUpdateStep", noticeDTO);
      noticeDTO.setNotice_step(noticeDTO.getNotice_step() + 1);
      noticeDTO.setNotice_level(noticeDTO.getNotice_level() + 1);
    }
    else {
      noticeDTO.setNotice_group(maxNum);
      noticeDTO.setNotice_number(maxNum);
      noticeDTO.setNotice_step(0);
      noticeDTO.setNotice_level(0);
    }
    sqlSession.insert("notice.getInsert", noticeDTO);

    return "redirect:/notice/list.do";
  }

  // 2-1. listNotice() ---------------------------------------------------------------------------->
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
  public String listNotice(
    @ModelAttribute("noticeDTO") NoticeDTO noticeDTO,
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
      cnt = sqlSession.selectOne("notice.getCount");
    }
    else {
      map3.put("columnParam", keyField);
      map3.put("keyWord", keyWord);
      cnt = sqlSession.selectOne("notice.getSearchCount", map3);
    }

    int curPage = Integer.parseInt(pageNum);
    PageTest pt = new PageTest(cnt, curPage);
    int startPos = pt.getStartRow() - 1;

    List<NoticeDTO> list = null;

    if (keyWord == null || keyWord.length() < 1 || keyWord == "") {
      map.put("start", new Integer(startPos));
      map.put("count", new Integer(pt.getPageSize()));

      list = sqlSession.selectList("notice.getList", map);
    }
    else if (keyWord != null || keyWord.length() > 1) {
      map2.put("columnParam", keyField);
      map2.put("keyWord", keyWord);
      map2.put("start", new Integer(startPos));
      map2.put("count", new Integer(pt.getPageSize()));

      list = sqlSession.selectList("notice.getSearch", map2);
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

    return "notice/list";
  }

  // 4-1. content() ------------------------------------------------------------------------------->
	@RequestMapping(value="/content.do", method=RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("notice_number"));
		sqlSession.update("notice.getUpdateCount", num);

		NoticeDTO dto = sqlSession.selectOne("notice.getDetails", num);
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);

		return "notice/content";
	}

  // 5-1. updateForm() --------------------------------------------------------------------------->
	@RequestMapping(value="/updateForm.do", method=RequestMethod.GET)
	public String updateForm(HttpServletRequest request,Model model) {

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("notice_number"));

		NoticeDTO dto = sqlSession.selectOne("notice.getDetails", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", dto);

		return "notice/updateForm";
	}

  // 4-1. updateCheck() --------------------------------------------------------------------------->
  @ResponseBody
  @RequestMapping(value = "/updateCheck.do", method = RequestMethod.POST)
  public Integer updateCheck(HttpServletRequest request, HttpSession session) throws Exception {

    Integer notice_number = Integer.parseInt(request.getParameter("notice_number"));
    String admin_id = (String) session.getAttribute("admin_id");
    String pageNum = request.getParameter("pageNum");

    NoticeDTO dto = sqlSession.selectOne("notice.getDetails", notice_number);

    Map<String, Object> map = new HashMap<>();
    map.put("notice_number", notice_number);
    map.put("notice_writer", admin_id);
    Integer count = sqlSession.selectOne("notice.getUpdateCheck", map);

    ModelAndView mv = new ModelAndView();
    mv.addObject("notice_number", notice_number);
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
  public String updatePro(HttpServletRequest request, NoticeDTO noticeDTO, Model model) {

    String pw = request.getParameter("notice_pw");

    sqlSession.update("notice.getUpdate", noticeDTO);

    model.addAttribute("notice_pw", pw);
    model.addAttribute("noticeDTO", noticeDTO);

    return "redirect:/notice/list.do";
  }

  // 6-2. deleteCheck() --------------------------------------------------------------------------->
  @ResponseBody
  @RequestMapping(value = "/deleteCheck.do", method = RequestMethod.POST)
  public Integer deleteCheck(HttpServletRequest request) {

    Integer notice_number = Integer.parseInt(request.getParameter("notice_number"));
    String notice_pw = request.getParameter("notice_pw");

    Map<String, Object> map = new HashMap<>();
    map.put("notice_number", notice_number);
    map.put("notice_pw", notice_pw);

    int count = sqlSession.selectOne("notice.getDeleteCheck", map);

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
		int num = Integer.parseInt(request.getParameter("notice_number"));

		sqlSession.delete("notice.getDelete", num);

		model.addAttribute("pageNum", pageNum);

		return "redirect:/notice/list.do";
	}

}