package com.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;


import com.po.Goods;

@Repository("adminGoodsDao")
@Mapper
public interface AdminGoodsDao {
	//查询所有商品
	public List<Goods> selectGoods();
	//分页查询所有商品
	public List<Goods> selectAllGoodsByPage(Map<String, Object> map);
	//根据id查询一个商品
	public Goods selectGoodsById(Integer id);
	//添加商品
	public int addGoods(Goods goods);
	//修改商品
	public int updateGoodsById(Goods goods);
	//删除单个商品
	public int deleteAGoods(Integer id);
	//删除多个商品
	public int deleteGoods(List<Integer> ids);
	
	public List<Map<String, Object>> selectCartGoods(Integer id);
	public List<Map<String, Object>> selectFocusGoods(Integer id);
	public List<Map<String, Object>> selectOrderdetailGoods(Integer id);

}