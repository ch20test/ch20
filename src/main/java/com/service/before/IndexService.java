package com.service.before;


import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.po.Goods;


public interface IndexService {
	public String before(Model model,HttpSession session, Goods goods);
	public String toRegister(Model model);
	public String toLogin(Model model);
}
