package com.good.neighbor.controller;

import java.util.HashMap;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.good.neighbor.model.MemberDTO;

@Controller
@RequestMapping("/member")
public class MemberController {

  // 0. auto-wired session factory ---------------------------------------------------------------->
  @Autowired
  private SqlSession sqlSession;

  // 1-1. insertForm() ---------------------------------------------------------------------------->
  @RequestMapping(value = "/insertForm.do", method = RequestMethod.GET)
  public String insertForm() {
    return "member/insertForm";
  }

  // 1-2. popup1() -------------------------------------------------------------------------------->
  @RequestMapping(value = "/agree_TermsOfUse.do", method = RequestMethod.GET)
  public String popup1(HttpSession session) {

    return "/member/agree_TermsOfUse";
  }

  // 1-3. popup2() -------------------------------------------------------------------------------->
  @RequestMapping(value = "/popupAgree.do", method = RequestMethod.GET)
  public String popup2(HttpSession session) {

    return "/member/popupAgree";
  }

  // 1-4. idCheck() ------------------------------------------------------------------------------->
  @ResponseBody
  @PostMapping(value = "/idCheck.do", produces = "application/text; charset=utf8")
  public Integer idCheck(HttpServletRequest request) throws Exception {

    String member_id = request.getParameter("member_id");
    Integer result = sqlSession.selectOne("member.getCheckId", member_id);

    // 1. 중복된 아이디가 있을 경우
    if (result != null) {
      return 1;
    }

    // 2. 중복된 아이디가 없을 경우
    else {
      return -1;
    }
  }

  // 1-5. insertPro() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/insertPro.do", method = RequestMethod.POST)
  public String insertPro(@ModelAttribute("memberDTO") MemberDTO memberDTO,
  HttpServletRequest request) throws Exception {

    sqlSession.insert("member.getInsert", memberDTO);

    return "member/loginForm";
  }

  // 2-1. loginForm() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/loginForm.do", method = RequestMethod.GET)
  public String loginForm( @CookieValue(value = "rememberMemberId", required = false) String checkbox, Model model, HttpSession session) throws Exception {

    return "member/loginForm";
  }

  // 2-2. loginPro() ------------------------------------------------------------------------------>
  @RequestMapping(value = "/loginPro.do", method = RequestMethod.POST)
  public String loginPro(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {

    String member_id = request.getParameter("member_id");
    String member_pw = request.getParameter("member_pw");
    String checkbox = request.getParameter("rememberId");

    HashMap<String, String> map = new HashMap<>();
    map.put("member_id", member_id);
    map.put("member_pw", member_pw);

    MemberDTO dto = sqlSession.selectOne("member.getLogin", map);

    if (dto == null) {
      return "member/loginForm";
    } else {
      HttpSession session = request.getSession();
      session.setAttribute("member_id", member_id);
    }

    if (checkbox != null) {
      Cookie cookie = new Cookie("member_id", member_id);
      cookie.setMaxAge(60 * 60 * 24 * 7);  // 7 days
      response.addCookie(cookie);
    }

    model.addAttribute("dto", dto);

    return "member/loginPro";
  }


  // 2-3. logout() -------------------------------------------------------------------------------->
  @RequestMapping(value = "/logout.do", method = RequestMethod.GET)
  public String logout() {

    return "member/logout";
  }

  // 3-1. getUpdate() ---------------------------------------------------------------------------->
  @RequestMapping(value = "/getUpdate.do", method = RequestMethod.POST)
  public String getUpdate(HttpServletRequest request, Model model) {

    // 세션에서 아이디값 받아오기
    HttpSession session = request.getSession();
    String member_id = (String) session.getAttribute("member_id");

    if (member_id == null) {
      return "member/loginForm";
    }

    MemberDTO dto = sqlSession.selectOne("member.getDetails", member_id);

    model.addAttribute("dto", dto);

    return "member/updateForm";
  }


  // 3-2. updatePro() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/updatePro.do", method = RequestMethod.POST)
  public String updatePro(@ModelAttribute("memberDTO") MemberDTO memberDTO,
  HttpServletRequest request, Model model) throws Exception {

    sqlSession.update("member.getUpdate", memberDTO);

    return "member/updatePro";
  }

  // 4-1. deleteForm() ---------------------------------------------------------------------------->
  @RequestMapping(value = "/deleteForm.do", method = RequestMethod.GET)
  public String deleteForm(Model model, HttpServletRequest request) {

    String member_id = request.getParameter("member_id");

    model.addAttribute("member_id", member_id);

    return "member/deleteForm";
  }

  // 4-2. deletePro() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/deletePro.do", method = RequestMethod.POST)
  public String deletePro(HttpServletRequest request) {

    String member_id = request.getParameter("member_id");
    String member_pw = request.getParameter("member_pw");

    System.out.println("member_id :" + member_id);
    System.out.println("member_pw :" + member_pw);

    Map<String, String> map = new HashMap<>();
    map.put("member_id", member_id);
    map.put("member_pw", member_pw);

    sqlSession.delete("member.getDelete", map);

    return "member/deletePro";
  }

  // 5-1. search_main() --------------------------------------------------------------------------->
  @RequestMapping(value = "/search_main", method = RequestMethod.GET)
  public String search_main() {

    return "member/search_main";
  }

  // 5-2. search_id() ----------------------------------------------------------------------------->
  @RequestMapping(value = "/search_id", method = RequestMethod.GET)
  public String search_id() {

    return "member/search_id";
  }

  // 5-3. search_id_pro() ------------------------------------------------------------------------->
  @RequestMapping(value = "/search_id_pro", method = RequestMethod.POST)
  public String searchIdPro(HttpServletRequest request, Model model) {

    String search_tel_name = request.getParameter("search_tel_name");
    String search_tel_number = request.getParameter("search_tel_number");

    System.out.println("member_name : " + search_tel_name);
    System.out.println("member_tel : " + search_tel_number);

    HashMap<String, String> map = new HashMap<>();
    map.put("member_name", search_tel_name);
    map.put("member_tel", search_tel_number);
    MemberDTO dto = sqlSession.selectOne("member.getSearchId", map);

    model.addAttribute("dto", dto);

    return "member/search_result_id";
  }

  // 5-4. search_pwd() ---------------------------------------------------------------------------->
  @RequestMapping(value = "/search_pwd", method = RequestMethod.GET)
  public String search_pwdForm() {

    return "member/search_pwd";
  }

  // 5-5. search_pwd_pro() ------------------------------------------------------------------------>
  @RequestMapping(value = "/search_pwd.do", method = RequestMethod.POST)
  public String search_pwdPro(HttpServletRequest request, Model model) {

    String writeID_search_pw = request.getParameter("writeID_search_pw");
    MemberDTO dto = sqlSession.selectOne("member.getDetails", writeID_search_pw);

    model.addAttribute("dto", dto);

    return "member/search_pwd_next";
  }

  // 5-6. search_pwd_next() ----------------------------------------------------------------------->
  @RequestMapping(value = "/search_pwd_next.do", method = RequestMethod.POST)
  public String search_pwd_nextForm(HttpServletRequest request, Model model) {

    String search_tel_name = request.getParameter("search_tel_name");
    String search_tel_number = request.getParameter("search_tel_number");
    String search_tel_id = request.getParameter("search_tel_id");

    HashMap<String, String> map = new HashMap<>();
    map.put("member_id", search_tel_id);
    map.put("member_name", search_tel_name);
    map.put("member_tel", search_tel_number);
    MemberDTO dto = sqlSession.selectOne("member.getSearchPw", map);

    model.addAttribute("dto", dto);

    return "member/search_result_pwd";
  }

}