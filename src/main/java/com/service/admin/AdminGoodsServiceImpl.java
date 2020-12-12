package com.service.admin;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.controller.admin.AdminGoodsController;
import com.dao.AdminGoodsDao;
import com.po.Goods;
import com.util.MyUtil;

@Service("adminGoodsService")
@Transactional
public class AdminGoodsServiceImpl implements AdminGoodsService {
	private static final Log logger = LogFactory.getLog(AdminGoodsController.class);
	@Autowired
	private AdminGoodsDao adminGoodsDao;
	/**
	 * 查询所有商品
	 */
	@Override
	public String selectGoodsService(Model model, Integer pageCur, String act) {
		List<Goods> allgoods = adminGoodsDao.selectGoods();
		//商品总数
		int temp = allgoods.size();
		model.addAttribute("totalCount",temp);
		//总页数
		int totalPage=0;
		if(temp==0){
			totalPage=0;
		}else{
			//取大于或等于指定值的最小整数，ceil天花板，例如11.5与11.1都取12
			totalPage=(int)Math.ceil((double)temp/10);
		}
		if(pageCur==null){
			pageCur=1;
		}
		//有多余的页面
		if((pageCur-1)*10>temp){
			pageCur--;
		}
		//分页查询
		Map<String,Object> map = new HashMap<String,Object>();
		//起始位置，从0开始
		map.put("startIndex", (pageCur-1)*10);
		//每页10条记录
		map.put("perPageSize", 10);
		allgoods = adminGoodsDao.selectAllGoodsByPage(map);
		model.addAttribute("allgoods",allgoods);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		
		//根据act返回不同界面
		//删除查询
		if("deleteSelect".equals(act)){
			return "admin/deleteSelectGoods";
		}
		//修改查询
		else if("updateSelect".equals(act)){
			return "admin/updateSelectGoods";
		}else{
			return "admin/selectGoods";
		}
	}
	
	/**
	 * 根据id查询一个商品（详情）
	 */
	@Override
	public String selectAGoodsService(Model model, Integer id, String act) {
		Goods agoods = adminGoodsDao.selectGoodsById(id);
		model.addAttribute("goods", agoods);
		if("updateAgoods".equals(act)){
			//修改商品页面
			return "admin/updateAgoods";
		}else{
			//商品详情页面
			return "admin/goodsDetail";
		}
	}
	
	/**
	 * 添加或修改商品
	 */
	@Override
	public String addOrUpdateGoodsService(Goods goods, HttpServletRequest request, String updateAct) {
		//上传文件
		//防止文件重名
		String newFileName="";
		String fileName = goods.getLogoImage().getOriginalFilename();
		//选择了文件
		if(fileName.length() > 0){
			String realpath = request.getServletContext().getRealPath("logos");					//实现文件上传
			String fileType = fileName.substring(fileName.lastIndexOf('.'));
			//防止文件名重名
			newFileName = MyUtil.getStringID() + fileType;
			goods.setGpicture(newFileName);
			File targetFile = new File(realpath, newFileName); 
			if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        } 
			//上传 
	        try {   
	        	goods.getLogoImage().transferTo(targetFile);
	        } catch (Exception e){
	        	e.printStackTrace();
	        }
		}
		//修改，updateAct不能与act重名，因为使用了转发
		if("update".equals(updateAct)){
			int id = goods.getId();
//			logger.info("修改页面");
			//修改到数据库
			if(adminGoodsDao.updateGoodsById(goods) > 0){
				logger.info("修改成功");
				return "forward:/adminGoods/selectGoods?act=updateSelect";
			}else{
					logger.info(id);
					logger.info("修改失败");
					return "admin/updateAgoods";
			     }
		}else{//添
			//保存到数据库
			if(adminGoodsDao.addGoods(goods) > 0){
				//转发到查询的controller
				logger.info("添加成功");
				return "forward:/adminGoods/selectGoods";
			}else{
				return "card/addCard";
				 }
		}
		
	}
	/**
	 * 删除单个商品
	 */
	@Override
	public String deleteAGoodsService(Model model, Integer id) {
		//商品有关联
		if(adminGoodsDao.selectCartGoods(id).size() > 0 ||
			adminGoodsDao.selectFocusGoods(id).size() > 0 || 
			adminGoodsDao.selectOrderdetailGoods(id).size() > 0) {
				model.addAttribute("msg", "商品有关联，不允许删除！");
			return "forward:/adminGoods/selectGoods?act=deleteSelect";
		}
		adminGoodsDao.deleteAGoods(id);
		model.addAttribute("msg", "成功删除商品！");
		return "forward:/adminGoods/selectGoods?act=deleteSelect";
	}
	/**
	 * 删除多个商品
	 */
	@Override
	public String deleteGoods(Integer[] ids, Model model) {
		List<Integer> list = new ArrayList<Integer>();
		for (int i = 0; i < ids.length; i++) {
			//商品有关联
			if(adminGoodsDao.selectCartGoods(ids[i]).size() > 0 ||
					adminGoodsDao.selectFocusGoods(ids[i]).size() > 0 || 
					adminGoodsDao.selectOrderdetailGoods(ids[i]).size() > 0) {
				model.addAttribute("msg", "商品有关联，不允许删除！");
				return "forward:/adminGoods/selectGoods?act=deleteSelect";
			}
			list.add(ids[i]);
		}
		adminGoodsDao.deleteGoods(list);
		model.addAttribute("msg", "成功删除商品！");
		return "forward:/adminGoods/selectGoods?act=deleteSelect";
	}

	/**
	 * 测试
	 */
	@Override
	public String test(Model model) {
		List<Goods> list= adminGoodsDao.selectGoods();
		model.addAttribute("allgoods", list);
		return "admin/test";
	}
	

}
