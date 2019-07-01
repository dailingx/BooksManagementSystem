package com.dxl.core.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dxl.common.utils.Page;
import com.dxl.core.po.Book;
import com.dxl.core.service.BookService;

@Controller
public class BookController {
  
  @Autowired
  private BookService bookService;
  
  /*
   * 书籍列表
   * page和rows需要一个默认值，因为第一次是不会传这两个值过来的
   */
  @RequestMapping(value="book/list.action")
  public String list(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="10")Integer rows, String bookName, Model model) {
    Page<Book> books = bookService.findBookList(page, rows, bookName);
    model.addAttribute("page", books);
    
    return "book";
  }
  
  /*
   * 创建图书
   * 接收的是json数据，返回的是字符串，不是逻辑视图，所以需要加上@ResponseBody注解
   */
  @RequestMapping("book/create.action")
  @ResponseBody
  public String bookCreate(Book book, HttpSession session) {
    int rows = bookService.createBook(book);
    if (rows > 0) {
      return "OK";
    } else {
      return "FAIL";
    }
  }
  
  /*
   * Book对象需要转成JSON，所以也需要@ResponseBody
   */
  @RequestMapping("book/getBookById.action")
  @ResponseBody
  public Book getBookById(Integer id) {
    Book book = bookService.getBookById(id);
    return book;
  }
  
  @RequestMapping("book/updateBook.action")
  @ResponseBody
  public String updateBook(Book book) {
    int rows = bookService.updateBook(book);
    if (rows > 0) {
      return "OK";
    } else {
      return "FAIL";
    }
  }
  
  @RequestMapping("book/delete.action")
  @ResponseBody
  public String bookDelete(Integer id) {
    int rows = bookService.deleteBook(id);
    if (rows > 0) {
      return "OK";
    } else {
      return "FAIL";
    }
  }

}
