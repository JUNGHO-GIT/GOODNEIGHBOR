package com.good.neighbor.model;

import java.sql.Timestamp;

public class QnaDTO {

  // fields --------------------------------------------------------------------------------------->
  private int qna_number;
  private int qna_readcount;
  private int qna_ref;
  private int qna_step;
  private int qna_level;
  private String qna_writer;
  private String qna_pw;
  private String qna_title;
  private String qna_content;
  private Timestamp qna_regdate;

  // getters -------------------------------------------------------------------------------------->
  public int getQna_number() {
    return qna_number;
  }
  public int getQna_readcount() {
    return qna_readcount;
  }
  public int getQna_ref() {
    return qna_ref;
  }
  public int getQna_step() {
    return qna_step;
  }
  public int getQna_level() {
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
  public void setQna_number(int qna_number) {
    this.qna_number = qna_number;
  }
  public void setQna_readcount(int qna_readcount) {
    this.qna_readcount = qna_readcount;
  }
  public void setQna_ref(int qna_ref) {
    this.qna_ref = qna_ref;
  }
  public void setQna_step(int qna_step) {
    this.qna_step = qna_step;
  }
  public void setQna_level(int qna_level) {
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
