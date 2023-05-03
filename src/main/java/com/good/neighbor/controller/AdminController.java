package com.good.neighbor.controller;

import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.good.neighbor.model.AdminDTO;

@Controller
@RequestMapping("/admin")
public class AdminController {

  // 0. auto-wired session factory ---------------------------------------------------------------->
	@Autowired
	private SqlSession sqlSession;

  // 1-1. insertForm() ---------------------------------------------------------------------------->
	@RequestMapping("/insertForm.do")
	public String insertForm() {

		return "admin/insertForm";
	}

  // 1-2. insertPro() ----------------------------------------------------------------------------->
	@RequestMapping(value="/insertPro", method=RequestMethod.POST)
	public String insertPro(HttpServletRequest request , Model model ,AdminDTO adminDTO) {

		sqlSession.insert("admin.getInsert", adminDTO);

		return "common/home";
	}

  // 2-1. idCheck() ------------------------------------------------------------------------------->
	@RequestMapping(value="/goodneighbor/member/admin/idCheck.do", method=RequestMethod.POST)
	public String idCheck(HttpServletRequest request, Model model) {

		int check = - 1;
		String admin_id =request.getParameter("admin_id");
		AdminDTO adminDTO = sqlSession.selectOne("admin.getDetails", admin_id);

		if(adminDTO == null) {
			check = 1;
		}

		model.addAttribute("check", check);

		return "/admin/idCheck";
	}

  // 3-1. loginForm() ----------------------------------------------------------------------------->
	@RequestMapping("/loginForm.do")
	public String loginForm() {

		return "admin/loginForm";
	}

  // 3-2. loginPro() ------------------------------------------------------------------------------>
	@RequestMapping(value="/loginPro", method=RequestMethod.POST)
	public String loginPro (HttpServletRequest request, Model model) {

		String admin_id = request.getParameter("admin_id");
		String admin_pw = request.getParameter("admin_pw");

		HashMap <String , String> map = new HashMap<>();

		map.put("admin_id", admin_id);
		map.put("admin_pw", admin_pw);

		AdminDTO dto = sqlSession.selectOne("admin.getLogin", map);

		model.addAttribute("dto", dto);

		return "admin/loginSuccess";
	}

  // 4-1. logOut() -------------------------------------------------------------------------------->
	@RequestMapping("/logOut.do")
	public String logOut() {

		return "admin/logOut";
	}

}