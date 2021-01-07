package com.po;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

/**
 * 与数据表ausertable对应
 */
public class Auser {
	@Email(message="请输入邮箱")
	private String aname;
	@NotBlank(message="密码不得为空")
	private String apwd;
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getApwd() {
		return apwd;
	}
	public void setApwd(String apwd) {
		this.apwd = apwd;
	}
}

