package com.good.neighbor.model;

import java.sql.Timestamp;

public class BoardDTO {

  // fields --------------------------------------------------------------------------------------->
	private int board_number;
	private String board_writer;
	private String board_title;
	private String board_content;
	private String board_pw;
	private Timestamp board_regdate;
	private int board_readcount;
	private int board_ref;
	private int board_step;
	private int board_level;
	private String board_ip;

  // getters -------------------------------------------------------------------------------------->
  public int getBoard_number() {
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
  public int getBoard_readcount() {
    return board_readcount;
  }
  public int getBoard_ref() {
    return board_ref;
  }
  public int getBoard_step() {
    return board_step;
  }
  public int getBoard_level() {
    return board_level;
  }
  public String getBoard_ip() {
    return board_ip;
  }

  // setters -------------------------------------------------------------------------------------->
  public void setBoard_number(int board_number) {
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
  public void setBoard_readcount(int board_readcount) {
    this.board_readcount = board_readcount;
  }
  public void setBoard_ref(int board_ref) {
    this.board_ref = board_ref;
  }
  public void setBoard_step(int board_step) {
    this.board_step = board_step;
  }
  public void setBoard_level(int board_level) {
    this.board_level = board_level;
  }
  public void setBoard_ip(String board_ip) {
    this.board_ip = board_ip;
  }

}