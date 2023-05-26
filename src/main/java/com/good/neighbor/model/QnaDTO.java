package com.good.neighbor.model;

import java.sql.Timestamp;

public class QnaDTO {

  // fields --------------------------------------------------------------------------------------->
  private Integer qna_number;
  private String qna_writer;
  private String qna_pw;
  private String qna_title;
  private String qna_content;
  private Integer qna_readcount;
  private Integer qna_group;
  private Integer qna_step;
  private Integer qna_level;
  private Timestamp qna_regdate;

  // getters -------------------------------------------------------------------------------------->
  public Integer getQna_number() {
    return qna_number;
  }
  public Integer getQna_readcount() {
    return qna_readcount;
  }
  public Integer getQna_group() {
    return qna_group;
  }
  public Integer getQna_step() {
    return qna_step;
  }
  public Integer getQna_level() {
    return qna_level;
  }
  public String getQna_writer() {
    return qna_writer;
  }
  public String getQna_pw() {
    return qna_pw;
  }
  public String getQna_title() {
    return qna_title;
  }
  public String getQna_content() {
    return qna_content;
  }
  public Timestamp getQna_regdate() {
    return qna_regdate;
  }

  // setters -------------------------------------------------------------------------------------->
  public void setQna_number(Integer qna_number) {
    this.qna_number = qna_number;
  }
  public void setQna_readcount(Integer qna_readcount) {
    this.qna_readcount = qna_readcount;
  }
  public void setQna_group(Integer qna_group) {
    this.qna_group = qna_group;
  }
  public void setQna_step(Integer qna_step) {
    this.qna_step = qna_step;
  }
  public void setQna_level(Integer qna_level) {
    this.qna_level = qna_level;
  }
  public void setQna_writer(String qna_writer) {
    this.qna_writer = qna_writer;
  }
  public void setQna_pw(String qna_pw) {
    this.qna_pw = qna_pw;
  }
  public void setQna_title(String qna_title) {
    this.qna_title = qna_title;
  }
  public void setQna_content(String qna_content) {
    this.qna_content = qna_content;
  }
  public void setQna_regdate(Timestamp qna_regdate) {
    this.qna_regdate = qna_regdate;
  }

}
