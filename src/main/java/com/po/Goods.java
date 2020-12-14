package com.po;

<<<<<<< HEAD
import org.springframework.web.multipart.MultipartFile;
=======
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.Range;
import org.springframework.web.multipart.MultipartFile;

public class Goods {
	private Integer id;
	//名称
	@NotBlank(message="名称不能为空")
	private String gname;
	//原价
	@NotNull(message="原价不能为空")
	@Range(min=0,message="价格不得小于0")
	private Double goprice;
	//折扣价
	@NotNull(message="折扣价不能为空")
	@Range(min=0,message="价格不得小于0")
	private Double grprice;
	@Range(min=0,message="库存不得小于0")
	private Integer gstore;
	private MultipartFile logoImage;
	private String gpicture;
	private Integer goodstype_id;
	//在根据id查询时使用
	private String typename;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public Double getGoprice() {
		return goprice;
	}
	public void setGoprice(Double goprice) {
		this.goprice = goprice;
	}
	public Double getGrprice() {
		return grprice;
	}
	public void setGrprice(Double grprice) {
		this.grprice = grprice;
	}
	public Integer getGstore() {
		return gstore;
	}
	public void setGstore(Integer gstore) {
		this.gstore = gstore;
	}
	public MultipartFile getLogoImage() {
		return logoImage;
	}
	public void setLogoImage(MultipartFile logoImage) {
		this.logoImage = logoImage;
	}
	public String getGpicture() {
		return gpicture;
	}
	public void setGpicture(String gpicture) {
		this.gpicture = gpicture;
	}
	public Integer getGoodstype_id() {
		return goodstype_id;
	}
	public void setGoodstype_id(Integer goodstype_id) {
		this.goodstype_id = goodstype_id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	
>>>>>>> branch 'master' of https://github.com/ch20test/ch20.git

public class Goods {
	private Integer id;
	private String gname;
	private Double goprice;
	private Double grprice;
	private Integer gstore;
	private MultipartFile logoImage;
	private String gpicture;
	private Integer goodstype_id;
	private String typename;//查询时使用
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getGname() {
		return gname;
	}
	public void setGname(String gname) {
		this.gname = gname;
	}
	public Double getGoprice() {
		return goprice;
	}
	public void setGoprice(Double goprice) {
		this.goprice = goprice;
	}
	public Double getGrprice() {
		return grprice;
	}
	public void setGrprice(Double grprice) {
		this.grprice = grprice;
	}
	public Integer getGstore() {
		return gstore;
	}
	public void setGstore(Integer gstore) {
		this.gstore = gstore;
	}
	public MultipartFile getLogoImage() {
		return logoImage;
	}
	public void setLogoImage(MultipartFile logoImage) {
		this.logoImage = logoImage;
	}
	public String getGpicture() {
		return gpicture;
	}
	public void setGpicture(String gpicture) {
		this.gpicture = gpicture;
	}
	public Integer getGoodstype_id() {
		return goodstype_id;
	}
	public void setGoodstype_id(Integer goodstype_id) {
		this.goodstype_id = goodstype_id;
	}
	public String getTypename() {
		return typename;
	}
	public void setTypename(String typename) {
		this.typename = typename;
	}
	
}
