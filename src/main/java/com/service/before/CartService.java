package com.service.before;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

public interface CartService {
	public String focus(Model model,Integer id, HttpSession session);   //关注商品
	public String putCart(Model model,Integer shoppingnum, Integer id, HttpSession session);  //加入购物车
	public String selectCart(Model model, HttpSession session); //查询购物车
	public String deleteAgoods(Integer id,HttpSession session);  //删除购物车
	public String clear(HttpSession session); //清空购物车 
	public String orderConfirm(Model model, HttpSession session);  //结算订单
}
