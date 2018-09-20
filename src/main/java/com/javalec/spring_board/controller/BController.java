package com.javalec.spring_board.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.javalec.spring_board.dao.BDao;

@Controller
public class BController {
	
//	BAction action;
//	public JdbcTemplate template; 
	
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
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		
		model.addAttribute("list", dao.listDao());
		
		return "/list";
	}
	
	@RequestMapping("/write_view")
	public String write_view(HttpServletRequest request, Model model) {
		
		return "write_view";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(HttpServletRequest request, Model model) {
		System.out.println("write()");
		BDao dao = sqlSession.getMapper(BDao.class);
		int bId = dao.findBId();
		dao.writeDao(bId+1, request.getParameter("bName"), 
				request.getParameter("bTitle"), 
				request.getParameter("bContent"));
		
		return "redirect:list";
	}
	
	@RequestMapping("/view")
	public String content_view(HttpServletRequest request, Model model) {
		System.out.println("view()");
		BDao dao = sqlSession.getMapper(BDao.class);
		
		//dao.upHit(Integer.parseInt(request.getParameter("bId")));
		model.addAttribute("board", dao.viewDao(Integer.parseInt(request.getParameter("bId"))));
		model.addAttribute("rboard", dao.viewReply(Integer.parseInt(request.getParameter("bId"))));
		
		return "view";
	}
	
	@RequestMapping("/modify_form")
	public String modify_form(HttpServletRequest request, Model model) {
		System.out.println("modify_form");
		BDao dao = sqlSession.getMapper(BDao.class);
		
		model.addAttribute("board", dao.viewDao(Integer.parseInt(request.getParameter("bId"))));
		
		return "modify_form";
	}
	
	@RequestMapping(method=RequestMethod.POST, value = "/modify")
	public String modify(HttpServletRequest request, Model model) {
		System.out.println("modify()");
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.modifyDao(Integer.parseInt(request.getParameter("bId")), 
				request.getParameter("bTitle"), 
				request.getParameter("bContent"));
		
		return "redirect:view?bId="+Integer.parseInt(request.getParameter("bId"));
	}
	
	@RequestMapping("/reply_form")
	public String reply_view(HttpServletRequest request, Model model) {
		System.out.println("review()");
		model.addAttribute("bId", request.getParameter("bId"));
		
		return "reply_form";
	}
	
	@RequestMapping("/comment_form")
	public String comment_form(HttpServletRequest request, Model model) {
		
		model.addAttribute("bId", request.getParameter("bId"));
		model.addAttribute("bReply", request.getParameter("bReply"));
		
		return "comment";
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String reply(HttpServletRequest request, Model model) {
		System.out.println("reply()");
		BDao dao = sqlSession.getMapper(BDao.class);
		int bId = dao.findRId();
		dao.replyDao(bId+1, request.getParameter("bName"), 
				request.getParameter("bContent"),
				Integer.parseInt(request.getParameter("bId")));
		dao.upReply(Integer.parseInt(request.getParameter("bId")));
		
		return "redirect:view?bId="+Integer.parseInt(request.getParameter("bId"));
	}
	
	@RequestMapping("/upHit")
	public String upHit(HttpServletRequest request, Model model) {
		System.out.println("upHit()");
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.upRHit(Integer.parseInt(request.getParameter("rId")));
		
		return "redirect:view?bId="+Integer.parseInt(request.getParameter("bId"));
	}
	
	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	public String comment(HttpServletRequest request, Model model) {
		System.out.println("comment()");
		BDao dao = sqlSession.getMapper(BDao.class);
		int bId = dao.findRId();
		dao.commentDao(bId+1, request.getParameter("bName"), 
				request.getParameter("bContent"),
				Integer.parseInt(request.getParameter("bId")), 
				Integer.parseInt(request.getParameter("bReply")));
		
		return "redirect:view?bId="+Integer.parseInt(request.getParameter("bId"));
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		System.out.println("delete()");
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.deleteDao(Integer.parseInt(request.getParameter("bId")));
		dao.deleteReply(Integer.parseInt(request.getParameter("bId")));
		
		return "redirect:list";
	}
}
