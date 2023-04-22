package com.good.neighbor.model;

import java.util.Date;

public class AdminDTO {

  // fields --------------------------------------------------------------------------------------->
	private String admin_id;
	private String admin_pw;
	private String admin_name;
	private String admin_tel;
	private Date admin_regdate;

  // getters -------------------------------------------------------------------------------------->
  public String getAdmin_id() {
    return admin_id;
  }
  public String getAdmin_pw() {
    return admin_pw;
  }
  public String getAdmin_name() {
    return admin_name;
  }
  public String getAdmin_tel() {
    return admin_tel;
  }
  public Date getAdmin_regdate() {
    return admin_regdate;
  }

  // setters -------------------------------------------------------------------------------------->
  public void setAdmin_id(String admin_id) {
    this.admin_id = admin_id;
  }
  public void setAdmin_pw(String admin_pw) {
    this.admin_pw = admin_pw;
  }
  public void setAdmin_name(String admin_name) {
    this.admin_name = admin_name;
  }
  public void setAdmin_tel(String admin_tel) {
    this.admin_tel = admin_tel;
  }
  public void setAdmin_regdate(Date admin_regdate) {
    this.admin_regdate = admin_regdate;
  }

}