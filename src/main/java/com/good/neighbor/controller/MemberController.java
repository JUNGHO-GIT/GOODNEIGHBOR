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

    return "/member/popupTerms";
  }

  // 1-3. popup2() -------------------------------------------------------------------------------->
  @RequestMapping(value = "/popupAgree.do", method = RequestMethod.GET)
  public String popup2(HttpSession session) {

    return "/member/popupAgree";
  }

  // 1-4. idCheck() ------------------------------------------------------------------------------->
  @ResponseBody
  @PostMapping(value = "/idCheck.do", produces = "text/plain; charset=utf-8")
  public String idCheck(HttpServletRequest request) throws Exception {

    String member_id = request.getParameter("member_id");
    Integer result = sqlSession.selectOne("member.getCheckId", member_id);

    // 1. 중복된 아이디가 있을 경우
    if (result != null && result > 0) {
      return "false";
    }
    else {
      return "true";
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

    HashMap<String, Object> map = new HashMap<>();
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

  // 3-1. updateForm() ---------------------------------------------------------------------------->
  @RequestMapping(value = "/updateForm.do", method = RequestMethod.POST)
  public String updateForm(HttpServletRequest request, Model model) {

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

    Map<String, Object> map = new HashMap<>();
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

  // 5-2. searchIdForm() -------------------------------------------------------------------------->
  @RequestMapping(value = "/searchIdForm", method = RequestMethod.GET)
  public String searchIdForm() {

    return "member/searchIdForm";
  }

  // 5-3. searchIdByTel() ------------------------------------------------------------------------->
  @RequestMapping(value = "/searchIdByTel.do", method = RequestMethod.POST)
  public String searchIdByTel(HttpServletRequest request, Model model) {

    String search_tel_name = request.getParameter("search_tel_name");
    String search_tel_number = request.getParameter("search_tel_number");

    HashMap<String, Object> map = new HashMap<>();
    map.put("member_name", search_tel_name);
    map.put("member_tel", search_tel_number);

    MemberDTO dto = sqlSession.selectOne("member.getSearchIdByTel", map);

    model.addAttribute("dto", dto);

    return "member/searchIdPro";
  }

  // 5-4. searchIdByEmail() ------------------------------------------------------------------>
  @RequestMapping(value = "/searchIdByEmail.do", method = RequestMethod.POST)
  public String searchIdByEmail(HttpServletRequest request, Model model) {

    String search_email_name = request.getParameter("search_email_name");
    String search_email_domain = request.getParameter("search_email_domain");

    HashMap<String, Object> map = new HashMap<>();
    map.put("member_name", search_email_name);
    map.put("member_email", search_email_domain);

    MemberDTO dto = sqlSession.selectOne("member.getSearchIdByEmail", map);

    model.addAttribute("dto", dto);

    return "member/searchIdPro";
  }

  // 6-1. searchPwForm() -------------------------------------------------------------------------->
  @RequestMapping(value = "/searchPwForm", method = RequestMethod.GET)
  public String searchPwForm() {

    return "member/searchPwForm";
  }

  // 6-2. searchPwByTel() ------------------------------------------------------------------------->
  @RequestMapping(value = "/searchPwByTel.do", method = RequestMethod.POST)
  public String searchPwByTel(HttpServletRequest request, Model model) {

    String search_tel_name = request.getParameter("search_tel_name");
    String search_tel_number = request.getParameter("search_tel_number");
    String search_tel_id = request.getParameter("search_tel_id");

    HashMap<String, Object> map = new HashMap<>();
    map.put("member_id", search_tel_id);
    map.put("member_name", search_tel_name);
    map.put("member_tel", search_tel_number);
    MemberDTO dto = sqlSession.selectOne("member.getSearchPwByTel", map);

    model.addAttribute("dto", dto);

    return "member/searchPwPro";
  }

  // 6-3. searchPwByEmail() ----------------------------------------------------------------------->
  @RequestMapping(value = "/searchPwByEmail.do", method = RequestMethod.POST)
  public String searchPwByEmail(HttpServletRequest request, Model model) {

    String search_email_name = request.getParameter("search_email_name");
    String search_email_domain = request.getParameter("search_email_domain");
    String search_email_id = request.getParameter("search_email_id");

    HashMap<String, Object> map = new HashMap<>();
    map.put("member_id", search_email_id);
    map.put("member_name", search_email_name);
    map.put("member_email", search_email_domain);
    MemberDTO dto = sqlSession.selectOne("member.getSearchPwByEmail", map);

    model.addAttribute("dto", dto);

    return "member/searchPwPro";
  }

}
