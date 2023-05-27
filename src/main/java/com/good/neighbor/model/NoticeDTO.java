package com.good.neighbor.model;

import java.sql.Timestamp;

public class NoticeDTO {

  // fields --------------------------------------------------------------------------------------->
  private Integer notice_number;
  private Integer notice_readcount;
  private String notice_writer;
  private String notice_pw;
  private String notice_title;
  private String notice_content;
  private Integer notice_group;
  private Integer notice_step;
  private Integer notice_level;
  private Timestamp notice_regdate;

  // getters -------------------------------------------------------------------------------------->
  public Integer getNotice_number() {
    return notice_number;
  }
  public Integer getNotice_readcount() {
    return notice_readcount;
  }
  public String getNotice_writer() {
    return notice_writer;
  }
  public String getNotice_pw() {
    return notice_pw;
  }
  public String getNotice_title() {
    return notice_title;
  }
  public String getNotice_content() {
    return notice_content;
  }
  public Integer getNotice_group() {
    return notice_group;
  }
  public Integer getNotice_step() {
    return notice_step;
  }
  public Integer getNotice_level() {
    return notice_level;
  }
  public Timestamp getNotice_regdate() {
    return notice_regdate;
  }

  // setters -------------------------------------------------------------------------------------->
  public void setNotice_number(Integer notice_number) {
    this.notice_number = notice_number;
  }
  public void setNotice_readcount(Integer notice_readcount) {
    this.notice_readcount = notice_readcount;
  }
  public void setNotice_writer(String notice_writer) {
    this.notice_writer = notice_writer;
  }
  public void setNotice_pw(String notice_pw) {
    this.notice_pw = notice_pw;
  }
  public void setNotice_title(String notice_title) {
    this.notice_title = notice_title;
  }
  public void setNotice_content(String notice_content) {
    this.notice_content = notice_content;
  }
  public void setNotice_group(Integer notice_group) {
    this.notice_group = notice_group;
  }
  public void setNotice_step(Integer notice_step) {
    this.notice_step = notice_step;
  }
  public void setNotice_level(Integer notice_level) {
    this.notice_level = notice_level;
  }
  public void setNotice_regdate(Timestamp notice_regdate) {
    this.notice_regdate = notice_regdate;
  }

}