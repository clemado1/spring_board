package com.javalec.spring_board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.javalec.spring_board.dao.BDao;
import com.javalec.spring_board.dto.BDto;
import com.javalec.spring_board.dto.PageInfo;
import com.javalec.spring_board.dto.TagDto;
import com.javalec.spring_board.dto.UserDto;

@Controller
public class BController {
	
//	BAction action;
//	public JdbcTemplate template; 
	
	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		String std = request.getParameter("std") == null ? "new" : request.getParameter("std");
		PageInfo pageInfo = null;
		ArrayList<BDto> list = null;
		
		if(std.equals("new")) {
			pageInfo = new PageInfo(page, dao.listCount(), 20);
			list = dao.listDao(pageInfo.getStartRow());
		}else if(std.equals("hot")) {
			pageInfo = new PageInfo(page, dao.listCount(), 20);
			list = dao.hotList(pageInfo.getStartRow());
		}else if(std.equals("mon")) {
			pageInfo = new PageInfo(page, dao.monCount(), 20);
			list = dao.monList(pageInfo.getStartRow());
		}
		
		model.addAttribute("tags", dao.tagNames());
		model.addAttribute("std", std);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		
		return "home";
	}
	
	@RequestMapping("/about")
	public String about(Locale locale, Model model) {
		return "board/about";
	}
	
	@RequestMapping(value = "/login")
	public String login(@RequestParam(value = "error", required = false) String error, Model model) {
		if (error != null) {
			model.addAttribute("error", "로그인 정보를 확인해주세요.");
		}
		return "security/login";
	}
	
	@RequestMapping("/logout")
	public String logout(Locale locale, Model model) {
		return "security/logout";
	}
	
	@RequestMapping("/joinForm")
	public String joinForm(Locale locale, Model model) {
		return "security/join";
	}
	
	@ResponseBody
	@RequestMapping("/emailck")
	public String emailck(UserDto udto, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		
		int result = dao.testEmail(udto.getEmail());
		return String.valueOf(result);
    }
	
	@RequestMapping("/nameck")
	@ResponseBody
	public String nameck(UserDto udto, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		
		int result = dao.testName(udto.getName());
		return String.valueOf(result);
    }
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		
		int count = dao.signUp(request.getParameter("email"), request.getParameter("name"), 
				passwordEncoder.encode(request.getParameter("passwd")));

		if(count == 1) {
			dao.signUpRole(request.getParameter("email"));
			request.getSession().setAttribute("messageType", "성공 메시지");
			request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다.");
		}else {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "회원가입 오류 발생");
		}
		
		return "redirect:/";
	}

	@RequestMapping(value = "/tag", method = RequestMethod.GET)
	public String tag(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		String std = request.getParameter("std") == null ? "bid" : request.getParameter("std");
		String tag = request.getParameter("q");
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		PageInfo pageInfo = new PageInfo(page, dao.tagCount(tag), 10);
		ArrayList<BDto> list = dao.tagList(tag, std.toUpperCase(), pageInfo.getStartRow());
		
		model.addAttribute("tags", dao.tagNames());
		model.addAttribute("std", std);
		model.addAttribute("tag", tag);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		
		return "board/tag";
	}
	
	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		String keyword = request.getParameter("keyword");
		String std = request.getParameter("std") == null ? "bid" : request.getParameter("std");
		int page = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));
		PageInfo pageInfo = new PageInfo(page, dao.slistCount(keyword), 10);
		ArrayList<BDto> list = null;
		
		if(!std.equals("rel")) {
			list = dao.slistDao(keyword, std.toUpperCase(), pageInfo.getStartRow());
		}else {
			list = dao.slistRel(keyword, pageInfo.getStartRow());
		}
		
		model.addAttribute("tags", dao.tagNames());
		model.addAttribute("std", std);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("pageInfo", pageInfo);
		
		return "board/list";
	}
	
	@RequestMapping("/write_form")
	public String write_view(HttpServletRequest request, Model model) {
		
		return "board/write";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(HttpServletRequest request, Model model) {

		BDao dao = sqlSession.getMapper(BDao.class);
		int bId = dao.findBId()+1;
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		dao.writeDao(bId, auth.getName(), 
				request.getParameter("title"), 
				request.getParameter("content").replaceAll("\r\n", "<br>"));
		
		if(request.getParameter("tags")!=null&&!request.getParameter("tags").equals("")) {
			String[] tag_arry = request.getParameter("tags").split(",");
			ArrayList<TagDto> tag_list = new ArrayList<TagDto>();
			int cnt = 0;
			for(int i = 0; i < tag_arry.length; i++) {
				if(cnt>=5) break;
				cnt++;
				if(!tag_arry[i].trim().equals("")) tag_list.add(new TagDto(i+1, bId, tag_arry[i].trim().replaceAll(" ", "_")));
			}
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bid", bId);
			map.put("tag_list", tag_list);
			dao.writeTag(map);
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/view")
	public String content_view(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		
		dao.upReadcount(Integer.parseInt(request.getParameter("id")));
		model.addAttribute("board", dao.viewDao(Integer.parseInt(request.getParameter("id"))));
		model.addAttribute("rboard", dao.viewReply(Integer.parseInt(request.getParameter("id"))));
		model.addAttribute("tags", dao.tagNames());
		model.addAttribute("randList", dao.randList());
		return "board/view";
	}
	
	@RequestMapping("/hit")
	public String upHit(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.upHit(Integer.parseInt(request.getParameter("id")));
		
		return "redirect:view?id="+Integer.parseInt(request.getParameter("id"));
	}
	
	@RequestMapping("/modify_form")
	public String modify_form(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		BDto dto = dao.viewDao(Integer.parseInt(request.getParameter("id")));
		dto.setContent(dto.getContent().replace("<br>", "\r\n"));
		String tag = "";
		for(String i :dto.getTags()) tag+=i+",";
		
		model.addAttribute("tag",tag);
		model.addAttribute("board", dto);
		
		return "board/modify";
	}
	
	@RequestMapping(method=RequestMethod.POST, value = "/modify")
	public String modify(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		int bId = Integer.parseInt(request.getParameter("bId"));
		dao.modifyDao(bId, request.getParameter("title"), 
				request.getParameter("content").replaceAll("\r\n", "<br>"));
		dao.deleteTag(bId);
		if(request.getParameter("tags")!=null) {
			String[] tag_arry = request.getParameter("tags").split(",");
			ArrayList<TagDto> tag_list = new ArrayList<TagDto>();
			int cnt = 0;
			for(int i = 0; i < tag_arry.length; i++) {
				if(cnt>=5) break;
				cnt++;
				if(!tag_arry[i].trim().equals("")) tag_list.add(new TagDto(i+1, bId, tag_arry[i].trim().replaceAll(" ", "_")));
			}
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("bid", bId);
			map.put("tag_list", tag_list);
			dao.writeTag(map);
		}
		
		return "redirect:view?id="+bId;
	}
	
	@RequestMapping(value = "/reply", method = RequestMethod.POST)
	public String reply(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		int bGroup = Integer.parseInt(request.getParameter("bId"));
		int bId = dao.findRId(bGroup);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		dao.replyDao(bId+1, auth.getName(), 
				request.getParameter("content").replaceAll("\r\n", "<br>"),bGroup);
		dao.upReply(Integer.parseInt(request.getParameter("bId")));
		
		return "redirect:view?id="+Integer.parseInt(request.getParameter("bId"));
	}
	
	@RequestMapping("/rehit")
	public String upRHit(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.upRHit(Integer.parseInt(request.getParameter("rId")));
		
		return "redirect:view?id="+Integer.parseInt(request.getParameter("bId"));
	}
	
	@RequestMapping(value = "/comment", method = RequestMethod.POST)
	public String comment(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		int bGroup = Integer.parseInt(request.getParameter("bId"));
		int bId = dao.findRId(bGroup);
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		dao.commentDao(bId+1, auth.getName(), 
				request.getParameter("content"), bGroup, 
				Integer.parseInt(request.getParameter("rId")));
		
		return "redirect:view?id="+Integer.parseInt(request.getParameter("bId"));
	}
	
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		int bId = Integer.parseInt(request.getParameter("id"));
		dao.deleteTag(bId);
		dao.deleteDao(bId);
		dao.deleteReplyAll(bId);
		
		return "redirect:/";
	}
	
	@RequestMapping("/re_del")
	public String re_del(HttpServletRequest request, Model model) {
		BDao dao = sqlSession.getMapper(BDao.class);
		dao.deleteReply(Integer.parseInt(request.getParameter("bId")), Integer.parseInt(request.getParameter("rId")));
		
		return "redirect:view?id="+Integer.parseInt(request.getParameter("bId"));
	}

}
