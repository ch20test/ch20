package com.service.admin;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.AdminGoodsDao;
import com.po.Goods;
import com.util.MyUtil;
@Service("adminGoodsService")
@Transactional
public class AdminGoodsServiceImpl implements AdminGoodsService {
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
		map.put("startIndes", (pageCur-1)*10);
		//每页10条记录
		map.put("perPageSize", 10);
		allgoods = adminGoodsDao.selectAllGoodsByPage(map);
		model.addAttribute("allgoods",allgoods);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageCur", pageCur);
		
		
		return "admin/selectGoods";
	}
	
	/**
	 * 根据id查询一个商品（详情）
	 */
	@Override
	public String selectAGoodsService(Model model, Integer id, String act) {
		Goods agoods = adminGoodsDao.selectGoodsById(id);
		model.addAttribute("agoods", agoods);
		return "admin/goodsDetail";
	}
	
	/**
	 * 添加商品
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
		if(adminGoodsDao.addGoods(goods)>0){
			//转发到控制层的查询
			return "forward:/adminGoods/selectGoods";
		}else{
			//不知道这是哪里
			return "card/addcard";
		}
		
	}
	

}
