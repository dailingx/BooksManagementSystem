package com.dxl.core.dao;

import java.util.List;

import com.dxl.core.po.Book;

public interface BookDao {
  //书籍列表的查询
  public List<Book> selectBookList(Book book);
  
  //书籍记录的数量，分页时需要使用
  public Integer selectBookListCount(Book book);
  
  public int createBook(Book book);
  
  public Book getBookById(Integer id);
  
  public int updateBook(Book book);
  
  public int deleteBook(Integer id);
}
