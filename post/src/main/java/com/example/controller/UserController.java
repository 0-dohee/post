package com.example.controller;

import javax.servlet.http.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.bind.annotation.*;

import com.example.domain.*;
import com.example.mapper.*;

@Controller
public class UserController {
	@Autowired
	UserMapper mapper;

	@RequestMapping("/login")
	public void login() {
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public int loginPost(UserVO vo, HttpSession session) {
		int result=0;
		
		String id=vo.getId();
		String pass=vo.getPass();
		UserVO uvo=mapper.read(id);
		String name=uvo.getName();

		if(uvo==null) {
			result=0;
		}else if(!uvo.getPass().equals(pass)) {
			result=1;
		}else {
			session.setAttribute("id", id);
			session.setAttribute("pass", pass);
			session.setAttribute("name", name);
			result=2;
		}
		
		return result;
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
}
