package com.dxl.core.dao;

import java.util.List;

import com.dxl.core.po.Book;

public interface BookDao {
  //�鼮�б�Ĳ�ѯ
  public List<Book> selectBookList(Book book);
  
  //�鼮��¼����������ҳʱ��Ҫʹ��
  public Integer selectBookListCount(Book book);
  
  public int createBook(Book book);
  
  public Book getBookById(Integer id);
  
  public int updateBook(Book book);
  
  public int deleteBook(Integer id);
}
