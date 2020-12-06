package com.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Goods;
import com.service.admin.AdminGoodsService;
@Controller
@RequestMapping("/adminGoods")
public class AdminGoodsController {
	@Autowired
	public AdminGoodsService adminGoodsService;
	/**
	 * 查询所有商品
	 */
	@RequestMapping("/selectGoods")
	public String selectGoods(Model model,Integer pageCur,String act){
		return adminGoodsService.selectGoodsService(model, pageCur, act);
	}
	/**
	 * 根据id查询一个商品（详情）
	 */
	@RequestMapping("/selectAGoods")
	public String selectAGoods(Model model,Integer id,String act){
		return adminGoodsService.selectAGoodsService(model,id,act);
	}
	/**
	 * add页面初始化
	 */
	@RequestMapping("/toAddGoods")
	public String toAddGoods(Model model){
		model.addAttribute("goods",new Goods());
		return "admin/addGoods";
	}
	/**
	 * 添加与修改商品
	 */
	@RequestMapping("/addGoods")
	public String addGoods(@ModelAttribute Goods goods,HttpServletRequest request,String updateAct){
		return adminGoodsService.addOrUpdateGoodsService(goods,request,updateAct);
	}

}
