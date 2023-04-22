package com.good.neighbor.model;

import java.sql.Timestamp;

public class MemberDTO {

  // fields --------------------------------------------------------------------------------------->
  private String member_id;
  private String member_pw;
  private String member_name;
  private String member_tel;
  private String member_email;
  private String member_zipcode;
  private String member_addr;
  private String member_addr2;
  private Timestamp member_regdate;

  // getters -------------------------------------------------------------------------------------->
  public String getMember_id() {
    return member_id;
  }
  public String getMember_pw() {
    return member_pw;
  }
  public String getMember_name() {
    return member_name;
  }
  public String getMember_tel() {
    return member_tel;
  }
  public String getMember_email() {
    return member_email;
  }
  public String getMember_zipcode() {
    return member_zipcode;
  }
  public String getMember_addr() {
    return member_addr;
  }
  public String getMember_addr2() {
    return member_addr2;
  }
  public Timestamp getMember_regdate() {
    return member_regdate;
  }

  // setters -------------------------------------------------------------------------------------->
  public void setMember_id(String member_id) {
    this.member_id = member_id;
  }
  public void setMember_pw(String member_pw) {
    this.member_pw = member_pw;
  }
  public void setMember_name(String member_name) {
    this.member_name = member_name;
  }
  public void setMember_tel(String member_tel) {
    this.member_tel = member_tel;
  }
  public void setMember_email(String member_email) {
    this.member_email = member_email;
  }
  public void setMember_zipcode(String member_zipcode) {
    this.member_zipcode = member_zipcode;
  }
  public void setMember_addr(String member_addr) {
    this.member_addr = member_addr;
  }
  public void setMember_addr2(String member_addr2) {
    this.member_addr2 = member_addr2;
  }
  public void setMember_regdate(Timestamp member_regdate) {
    this.member_regdate = member_regdate;
  }

}