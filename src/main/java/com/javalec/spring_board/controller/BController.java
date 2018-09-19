package com.javalec.spring_board.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.spring_board.action.BAction;
import com.javalec.spring_board.action.BContentAction;
import com.javalec.spring_board.action.BDeleteAction;
import com.javalec.spring_board.action.BListAction;
import com.javalec.spring_board.action.BModifyAction;
import com.javalec.spring_board.action.BReplyAction;
import com.javalec.spring_board.action.BReplyViewAction;
import com.javalec.spring_board.action.BWriteAction;
import com.javalec.spring_board.dao.BDao;
import com.javalec.spring_board.util.Constant;

@Controller
public class BController {
	
	BAction action;
	public JdbcTemplate template; 
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/login")
	public String login(Locale locale, Model model) {
		return "security/login";
	}
	
	@RequestMapping("/logout")
	public String logout(Locale locale, Model model) {
		return "security/logout";
	}
	
	@RequestMapping("/welcome")
	public String welcome(Locale locale, Model model) {
		return "security/welcome";
	}
	
	@RequestMapping("/loginForm")
	public String loginForm(Locale locale, Model model) {
		return "security/loginForm";
	}
	
//	@Autowired
//	public void setTemplate(JdbcTemplate template) {
//		this.template = template;
//		Constant.template = this.template;
//	}
//	
	@RequestMapping("/list")
	public String list(Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		
		model.addAttribute("list", dao.listDao());
		
		return "/list";
	}
	
	@RequestMapping("/write_view")
	public String write_view(Model model) {
		System.out.println("write_view()");
		
		return "write_view";
	}
	
	@RequestMapping("/write")
	public String write(HttpServletRequest request, Model model) {
		System.out.println("write()");
		
		model.addAttribute("request", request);
		action = new BWriteAction();
		action.execute(model);
		
		return "redirect:list";
	}
	
	@RequestMapping("/content_view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("view()");
		model.addAttribute("request", request);
		action = new BContentAction();
		action.execute(model);
		
		return "content_view";
	}
	
	@RequestMapping(method=RequestMethod.POST, value = "/modify")
	public String modify(HttpServletRequest request, Model model) {
		System.out.println("modify()");
		model.addAttribute("request", request);
		action = new BModifyAction();
		action.execute(model);
		
		return "redirect:list";
	}
	
	@RequestMapping("/reply_view")
	public String reply_view(HttpServletRequest request, Model model) {
		System.out.println("review()");
		model.addAttribute("request", request);
		action = new BReplyViewAction();
		action.execute(model);
		
		return "reply_view";
	}
	
	@RequestMapping("/reply")
	public String reply(HttpServletRequest request, Model model) {
		System.out.println("reply()");
		model.addAttribute("request", request);
		action = new BReplyAction();
		action.execute(model);
		
		return "redirect:list";
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete()");
		model.addAttribute("request", request);
		action = new BDeleteAction();
		action.execute(model);
		
		return "redirect:list";
	}
}
