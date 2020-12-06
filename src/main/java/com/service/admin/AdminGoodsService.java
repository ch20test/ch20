package com.service.admin;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.po.Goods;
import org.springframework.ui.Model;
public interface AdminGoodsService {
	//分页查询商品
	public String selectGoodsService(Model model,Integer pageCur,String act);
	//根据id查询一个商品（详情）
	public String selectAGoodsService(Model model, Integer id, String act);
	//添加商品
	public String addOrUpdateGoodsService(Goods goods,HttpServletRequest request,String updateAct);

}
