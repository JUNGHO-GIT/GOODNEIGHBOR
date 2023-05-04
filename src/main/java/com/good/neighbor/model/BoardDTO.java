package com.good.neighbor.model;

import java.sql.Timestamp;

public class BoardDTO {

  // fields --------------------------------------------------------------------------------------->
	private Integer board_number;
	private String board_writer;
	private String board_title;
	private String board_content;
	private String board_pw;
	private Timestamp board_regdate;
	private Integer board_readcount;
	private Integer board_group;
	private Integer board_step;
	private Integer board_level;
	private String board_ip;
  private int next_step;
  private int next_level;


  // getters -------------------------------------------------------------------------------------->
  public Integer getBoard_number() {
    return board_number;
  }
  public String getBoard_writer() {
    return board_writer;
  }
  public String getboard_title() {
    return board_title;
  }
  public String getBoard_content() {
    return board_content;
  }
  public String getBoard_pw() {
    return board_pw;
  }
  public Timestamp getBoard_regdate() {
    return board_regdate;
  }
  public Integer getBoard_readcount() {
    return board_readcount;
  }
  public Integer getBoard_group() {
    return board_group;
  }
  public Integer getBoard_step() {
    return board_step;
  }
  public Integer getBoard_level() {
    return board_level;
  }
  public String getBoard_ip() {
    return board_ip;
  }
  public int getNext_step() {
    return next_step;
  }
  public int getNext_level() {
    return next_level;
  }

  // setters -------------------------------------------------------------------------------------->
  public void setBoard_number(Integer board_number) {
    this.board_number = board_number;
  }
  public void setBoard_writer(String board_writer) {
    this.board_writer = board_writer;
  }
  public void setboard_title(String board_title) {
    this.board_title = board_title;
  }
  public void setBoard_content(String board_content) {
    this.board_content = board_content;
  }
  public void setBoard_pw(String board_pw) {
    this.board_pw = board_pw;
  }
  public void setBoard_regdate(Timestamp board_regdate) {
    this.board_regdate = board_regdate;
  }
  public void setBoard_readcount(Integer board_readcount) {
    this.board_readcount = board_readcount;
  }
  public void setBoard_group(Integer board_group) {
    this.board_group = board_group;
  }
  public void setBoard_step(Integer board_step) {
    this.board_step = board_step;
  }
  public void setBoard_level(Integer board_level) {
    this.board_level = board_level;
  }
  public void setBoard_ip(String board_ip) {
    this.board_ip = board_ip;
  }
  public void setNext_step(int next_step) {
    this.next_step = next_step;
  }
  public void setNext_level(int next_level) {
    this.next_level = next_level;
  }

}