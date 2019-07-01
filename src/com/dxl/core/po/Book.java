package com.dxl.core.po;

import java.io.Serializable;
import java.sql.Date;

public class Book implements Serializable {
  private static final long serialVersionUID = 1L;
  private Integer book_id;
  private String book_name;
  private String book_author;
  private String book_press;
  private String book_presstime;
  private String book_price;
  private Integer book_number;
  private String book_location;
  private Integer start;         
  private Integer rows;    
  public Integer getBook_id() {
    return book_id;
  }
  public void setBook_id(Integer book_id) {
    this.book_id = book_id;
  }
  public String getBook_name() {
    return book_name;
  }
  public void setBook_name(String book_name) {
    this.book_name = book_name;
  }
  public String getBook_author() {
    return book_author;
  }
  public void setBook_author(String book_author) {
    this.book_author = book_author;
  }
  public String getBook_press() {
    return book_press;
  }
  public void setBook_press(String book_press) {
    this.book_press = book_press;
  }
  public String getBook_presstime() {
    return book_presstime;
  }
  public void setBook_presstime(String book_presstime) {
    this.book_presstime = book_presstime;
  }
  public String getBook_price() {
    return book_price;
  }
  public void setBook_price(String book_price) {
    this.book_price = book_price;
  }
  public Integer getBook_number() {
    return book_number;
  }
  public void setBook_number(Integer book_number) {
    this.book_number = book_number;
  }
  public String getBook_location() {
    return book_location;
  }
  public void setBook_location(String book_location) {
    this.book_location = book_location;
  }
  public static long getSerialversionuid() {
    return serialVersionUID;
  }
  public Integer getStart() {
    return start;
  }
  public void setStart(Integer start) {
    this.start = start;
  }
  public Integer getRows() {
    return rows;
  }
  public void setRows(Integer rows) {
    this.rows = rows;
  }
}
