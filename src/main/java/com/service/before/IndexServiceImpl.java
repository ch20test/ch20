package com.service.before;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.dao.AdminNoticeDao;
import com.dao.AdminTypeDao;
import com.dao.IndexDao;
import com.po.Buser;
import com.po.Goods;

@Service("indexService")
@Transactional
public class IndexServiceImpl implements IndexService{

	@Autowired
	private IndexDao indexDao;
	@Autowired
	private AdminTypeDao adminTypeDao;
	@Autowired
	private AdminNoticeDao adminNoticeDao;
	@Override
	public String before(Model model, HttpSession session, Goods goods) {
		session.setAttribute("goodsType", adminTypeDao.selectGoodsType());
		model.addAttribute("salelist", indexDao.getSaleOrder());
		model.addAttribute("focuslist", indexDao.getFocusOrder());
		model.addAttribute("noticelist", indexDao.selectNotice());
		if(goods.getId() == null) 
			goods.setId(0);
		model.addAttribute("lastedlist", indexDao.getLastedGoods(goods));
		return "before/index";
	}
	
	@Override
	public String toRegister(Model model) {
		model.addAttribute("rbuser", new Buser());
		return "before/register";
	}

	@Override
	public String toLogin(Model model) {
		model.addAttribute("lbuser", new Buser());
		return "before/login";
	}

}
