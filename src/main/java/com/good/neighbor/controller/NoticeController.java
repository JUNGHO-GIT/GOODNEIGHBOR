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

  // 1-1. insertPro() ----------------------------------------------------------------------------->
	@RequestMapping(value="/insertPro.do", method=RequestMethod.POST)
	public String insertPro(NoticeDTO noticeDTO, HttpServletRequest request) {

    String fixed=request.getParameter("fixed");

    if(fixed == null){
      sqlSession.insert("notice.insertNotice", noticeDTO);
      System.out.println("fixed(null):"+fixed);
    }
    else {
      sqlSession.insert("notice.fixNotice", noticeDTO);
      System.out.println("fixed:"+fixed);
    }
		return "redirect:/notice/list.do";
	}

  // 2-1. noticeList() ---------------------------------------------------------------------------->
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public String noticeList(
    @ModelAttribute("noticeDTO") NoticeDTO noticeDTO,
		@RequestParam(value="pageNum", required = false) String pageNum,
    Model model, HttpServletRequest request
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
      cnt = sqlSession.selectOne("board.selectCount");
    }
    else {
      map3.put("columnParam", keyField);
      map3.put("keyWord", keyWord);
      cnt = sqlSession.selectOne("board.searchCount", map3);
    }

    int curPage = Integer.parseInt(pageNum);
    PageTest pt = new PageTest(cnt,curPage);
    int startPos = pt.getStartRow() - 1;

    List<NoticeDTO> list = null;

    if(keyWord == null || keyWord.length() < 1 || keyWord == "") {
      map.put("start", startPos);
      map.put("count", pt.getPageSize());

      list = sqlSession.selectList("notice.selectNotice",map);
    }
    else if(keyWord != null || keyWord.length()>1){
      map2.put("columnParam", keyField);
      map2.put("keyWord", keyWord);
      map2.put("start", startPos);
      map2.put("count", pt.getPageSize());

      list = sqlSession.selectList("notice.searchNotice",map2);
    }

		if(pt.getEndPage()>pt.getPageCnt()) {
			pt.setEndPage(pt.getPageCnt());
		}
		int number = cnt-(curPage - 1)*pt.getPageSize();

		List<NoticeDTO>fixList = sqlSession.selectList("notice.selectFix");

		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("keyField", keyField);
		model.addAttribute("keyWord", keyWord);
		model.addAttribute("pt", pt);
		model.addAttribute("cnt", cnt);
		model.addAttribute("list",list);
		model.addAttribute("fixList",fixList);

		return "notice/list";
	}

  // 3-1. searchPro() ----------------------------------------------------------------------------->
  /*
  @RequestMapping(value="/search.do", method=RequestMethod.GET)
  public String searchPro(HttpServletRequest request, NoticeDTO noticeDTO,
  @RequestParam(value="pageNum",required=false) String pageNum, Model model) {
  if(pageNum == null) {
  pageNum = "1";
  }
  String keyWord=request.getParameter("keyWord");
  String keyField=request.getParameter("keyField");
  System.out.println(keyWord);
  System.out.println(keyField);

  int cnt = sqlSession.selectOne("notice.searchCount");
  int curPage=Integer.parseInt(pageNum);

  util.PageTest pt = new PageTest(cnt,curPage);
  int startPos=pt.getStartRow() - 1;

  Map<String, Object> map = new HashMap<>();
  map.put("start", new Integer(startPos));
  map.put("count", new Integer(pt.getPageSize()));
  map.put("keyWord", keyWord);
  map.put("columnParam", keyField);

  List<NoticeDTO> list = sqlSession.selectList("notice.searchNotice",map);

  if(pt.getEndPage()>pt.getPageCnt()) {
  pt.setEndPage(pt.getPageCnt());
  }
  int number = cnt-(curPage - 1)*pt.getPageSize();

  model.addAttribute("number", number);
  model.addAttribute("pageNum", pageNum);
  model.addAttribute("pt", pt);
  model.addAttribute("cnt", cnt);
  model.addAttribute("list",list);

  return "notice/search";
  }*/

  // 4-1. content() ------------------------------------------------------------------------------->
	@RequestMapping(value="/delete.do", method=RequestMethod.GET)
	public String content(HttpServletRequest request, Model model) {

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("notice_number"));
		sqlSession.update("notice.readCnt", num);

		NoticeDTO dto = sqlSession.selectOne("notice.oneNotice", num);
		model.addAttribute("dto", dto);
		model.addAttribute("pageNum", pageNum);

		return "notice/content";
	}

  // 5-1. editForm() ------------------------------------------------------------------------------>
	@RequestMapping(value="/editForm.do", method=RequestMethod.GET)
	public String editForm(HttpServletRequest request,Model model) {

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("notice_number"));

		NoticeDTO dto = sqlSession.selectOne("notice.oneNotice", num);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("dto", dto);

		return "notice/editForm";
	}

  // 5-2. editPro() ------------------------------------------------------------------------------->
	@RequestMapping(value="editPro.do", method=RequestMethod.POST)
	public String editPro(NoticeDTO noticeDTO,HttpServletRequest request,Model model) {

		String pageNum = request.getParameter("pageNum");
		String fixed=request.getParameter("fixed");

		if(fixed == null) {
		  sqlSession.update("notice.editNotice", noticeDTO);
		}
    else {
		  sqlSession.update("notice.updateFix", noticeDTO);
		}
		model.addAttribute("pageNum", pageNum);

		return "redirect:/notice/list.do";
	}

  // 6-1. deletePro() ---------------------------------------------------------------------------->
	@RequestMapping(value="/deletePro.do", method=RequestMethod.GET)
	public String deletePro(HttpServletRequest request, Model model) {

		String pageNum = request.getParameter("pageNum");
		int num = Integer.parseInt(request.getParameter("notice_number"));

		sqlSession.delete("notice.deleteNotice", num);

		model.addAttribute("pageNum", pageNum);

		return "redirect:/notice/list.do";
	}

}