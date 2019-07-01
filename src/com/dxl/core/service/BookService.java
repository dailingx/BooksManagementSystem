package com.dxl.core.service;

import java.util.List;

import com.dxl.common.utils.Page;
import com.dxl.core.po.Book;

public interface BookService {
  
  //查询书籍列表,存在分页对象里面，因为取的时候取的是分页的,传入当前页page,显示条数rows以及查询的条件信息
  public Page<Book> findBookList(Integer page, Integer rows, String bookName);

  public int createBook(Book book);
  
  public Book getBookById(Integer id);
  
  public Book getBookByName(String book_name);
  
  public int updateBook(Book book);
  
  public int deleteBook(Integer id);
}
