package com.javalec.spring_board.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.javalec.spring_board.dao.BDaoc;
import com.javalec.spring_board.dto.BDto;

public class BReplyViewAction implements BAction{

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String bId = request.getParameter("bId");
		
		BDaoc dao = new BDaoc();
		BDto dto = dao.replyView(bId);
		
		model.addAttribute("reply_view", dto);
	}

}
