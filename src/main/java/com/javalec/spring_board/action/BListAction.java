package com.javalec.spring_board.action;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.javalec.spring_board.dao.BDaoc;
import com.javalec.spring_board.dto.BDto;

public class BListAction implements BAction {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		
		BDaoc dao = new BDaoc();
		ArrayList<BDto> dtos = dao.list();
		
		model.addAttribute("list", dtos);

	}

}
