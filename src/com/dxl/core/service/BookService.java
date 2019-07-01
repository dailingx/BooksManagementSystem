package com.dxl.core.service;

import java.util.List;

import com.dxl.common.utils.Page;
import com.dxl.core.po.Book;

public interface BookService {
  
  //��ѯ�鼮�б�,���ڷ�ҳ�������棬��Ϊȡ��ʱ��ȡ���Ƿ�ҳ��,���뵱ǰҳpage,��ʾ����rows�Լ���ѯ��������Ϣ
  public Page<Book> findBookList(Integer page, Integer rows, String bookName);

  public int createBook(Book book);
  
  public Book getBookById(Integer id);
  
  public Book getBookByName(String book_name);
  
  public int updateBook(Book book);
  
  public int deleteBook(Integer id);
}
