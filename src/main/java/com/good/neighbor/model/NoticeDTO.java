package com.good.neighbor.model;

import java.sql.Timestamp;

public class NoticeDTO {

  // fields --------------------------------------------------------------------------------------->
  private Integer notice_number;
  private Integer notice_readcount;
  private String notice_writer;
  private String notice_title;
  private String notice_content;
  private Timestamp notice_regdate;
  private boolean notice_fix;

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
  public String getNotice_title() {
    return notice_title;
  }
  public String getNotice_content() {
    return notice_content;
  }
  public Timestamp getNotice_regdate() {
    return notice_regdate;
  }
  public boolean isNotice_fix() {
    return notice_fix;
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
  public void setNotice_title(String notice_title) {
    this.notice_title = notice_title;
  }
  public void setNotice_content(String notice_content) {
    this.notice_content = notice_content;
  }
  public void setNotice_regdate(Timestamp notice_regdate) {
    this.notice_regdate = notice_regdate;
  }
  public void setNotice_fix(boolean notice_fix) {
    this.notice_fix = notice_fix;
  }

}