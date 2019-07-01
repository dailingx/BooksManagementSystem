package com.dxl.core.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dxl.common.utils.Page;
import com.dxl.core.dao.BookDao;
import com.dxl.core.po.Book;
import com.dxl.core.service.BookService;

@Service("bookService")
@Transactional
public class BookServiceImpl implements BookService{

  @Autowired
  private BookDao BookDao;
  @Override
  public Page<Book> findBookList(Integer page, Integer rows, String bookName) {
    
    Book book = new Book();
    
    if (StringUtils.isNotBlank(bookName)) {//不为空
      book.setBook_name(bookName);;
    }
    
    //设置当前页
    book.setStart((page-1)*rows);
    //每页数量
    book.setRows(rows);
    //查询书籍列表
    List<Book> books = BookDao.selectBookList(book);
    //查询书籍列表总记录数
    Integer count = BookDao.selectBookListCount(book);
    //创建Page返回对象,Page封装了所有页面需要的数据
    Page<Book> result = new Page<Book>();
    result.setPage(page);
    result.setRows(books);
    result.setSize(rows);
    result.setTotal(count);
    return result;
  }
  
  @Override
  public int createBook(Book book) {
    return BookDao.createBook(book);
  }

  @Override
  public Book getBookById(Integer id) {
    return BookDao.getBookById(id);
  }

  @Override
  public int updateBook(Book book) {
    return BookDao.updateBook(book);
  }

  @Override
  public int deleteBook(Integer id) {
    return BookDao.deleteBook(id);
  }

  @Override
  public Book getBookByName(String book_name) {
    return null;
  }

}
