package com.good.neighbor.model;

import java.util.Date;

public class ProductDTO {

  // fields --------------------------------------------------------------------------------------->
  private int product_id;
  private String product_name;
  private String product_detail;
  private String product_price;
  private String product_stock;
  private String product_company;
  private Date product_date;
  private byte[] product_image;
  private String product_imageName;

  // getters -------------------------------------------------------------------------------------->
  public int getProduct_id() {
    return product_id;
  }
  public String getProduct_name() {
    return product_name;
  }
  public String getProduct_detail() {
    return product_detail;
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
  public Date getProduct_date() {
    return product_date;
  }
  public byte[] getProduct_image() {
    return product_image;
  }
  public String getProduct_imageName() {
    return product_imageName;
  }

  // setters -------------------------------------------------------------------------------------->
  public void setProduct_id(int product_id) {
    this.product_id = product_id;
  }
  public void setProduct_name(String product_name) {
    this.product_name = product_name;
  }
  public void setProduct_detail(String product_detail) {
    this.product_detail = product_detail;
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
  public void setProduct_date(Date product_date) {
    this.product_date = product_date;
  }
  public void setProduct_image(byte[] product_image) {
    this.product_image = product_image;
  }
  public void setProduct_imageName(String product_imageName) {
    this.product_imageName = product_imageName;
  }

}