package com.controller.admin;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.po.Goods;
import com.service.admin.AdminGoodsService;
@Controller
@RequestMapping("/adminGoods")
public class AdminGoodsController extends BaseController{
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
	public String addGoods(@Valid @ModelAttribute Goods goods,BindingResult result,HttpServletRequest request,String updateAct){
		if(result.hasErrors()){
			return "admin/addGoods";
		}else{
			return adminGoodsService.addOrUpdateGoodsService(goods, request,updateAct);
		}
	}
	/**
	 * 删除单个商品
	 */
	@RequestMapping("/deleteAGoods")
	public String deleteAGoods(Model model,Integer id){
		return adminGoodsService.deleteAGoodsService(model,id);
		
	}
	/**
	 * 删除多个商品
	 */
	@RequestMapping("/deleteGoods")
	public String deleteGoods(Integer ids[], Model model) {
		return adminGoodsService.deleteGoods(ids, model);
	}
	
	/**
	 * 测试
	 */
	@RequestMapping("/test")
	public String test(Model model){
		return adminGoodsService.test(model);
	}
}
