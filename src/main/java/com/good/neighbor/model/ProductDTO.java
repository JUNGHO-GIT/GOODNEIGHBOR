package com.good.neighbor.model;

import java.sql.Timestamp;

public class ProductDTO {

  // fields --------------------------------------------------------------------------------------->
  private Integer product_number;
  private String product_name;
  private String product_content;
  private String product_price;
  private String product_stock;
  private String product_company;
  private Integer product_readcount;
	private Integer product_group;
	private Integer product_step;
	private Integer product_level;
  private String product_image;
  private Timestamp product_regdate;

  // getters -------------------------------------------------------------------------------------->
  public Integer getProduct_number() {
    return product_number;
  }
  public String getProduct_name() {
    return product_name;
  }
  public String getProduct_content() {
    return product_content;
  }
  public String getProduct_price() {
    return product_price;
  }
  public String getProduct_stock() {
    return product_stock;
  }
  public String getProduct_company() {
    return product_company;
  }
  public Integer getProduct_readcount() {
    return product_readcount;
  }
  public Integer getProduct_group() {
    return product_group;
  }
  public Integer getProduct_step() {
    return product_step;
  }
  public Integer getProduct_level() {
    return product_level;
  }
  public String getProduct_image() {
    return product_image;
  }
  public Timestamp getProduct_regdate() {
    return product_regdate;
  }

  // setters -------------------------------------------------------------------------------------->
  public void setProduct_number(Integer product_number) {
    this.product_number = product_number;
  }
  public void setProduct_name(String product_name) {
    this.product_name = product_name;
  }
  public void setProduct_content(String product_content) {
    this.product_content = product_content;
  }
  public void setProduct_price(String product_price) {
    this.product_price = product_price;
  }
  public void setProduct_stock(String product_stock) {
    this.product_stock = product_stock;
  }
  public void setProduct_company(String product_company) {
    this.product_company = product_company;
  }
  public void setProduct_readcount(Integer product_readcount) {
    this.product_readcount = product_readcount;
  }
  public void setProduct_group(Integer product_group) {
    this.product_group = product_group;
  }
  public void setProduct_step(Integer product_step) {
    this.product_step = product_step;
  }
  public void setProduct_level(Integer product_level) {
    this.product_level = product_level;
  }
  public void setProduct_image(String product_image) {
    this.product_image = product_image;
  }
  public void setProduct_regdate(Timestamp product_regdate) {
    this.product_regdate = product_regdate;
  }
}
