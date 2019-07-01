package com.dxl.core.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dxl.core.po.User;
import com.dxl.core.service.UserService;

@Controller
public class UserController {
  @Autowired
  private UserService userService;
  @RequestMapping(value="/login.action", method=RequestMethod.POST)
  public String login(String username, String password, Model model, HttpSession session) {
    User user = userService.findUser(username, password);
    if (user != null) {
      if (user.getUser_state() == 1) {
        session.setAttribute("USER_SESSION", user);
        return "redirect:/book/list.action";
      } else {
        model.addAttribute("msg", "当前用户已失效");
        return "login";
      }
    }
    model.addAttribute("msg", "账户密码错误，请重新输入");
    return "login";
  }
  
  @RequestMapping(value="/login.action",method=RequestMethod.GET)
  public String login() {
    return "login";
  }
  
//  @RequestMapping(value="toBook.action")
//  public String toBook() {
//    return "book";
//  }
  
  @RequestMapping(value="logout.action")
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:login.action";
  }
  
  @RequestMapping(value="/administrator/list.action")
  public String selectAdministrator(@RequestParam(defaultValue="1")Integer page, @RequestParam(defaultValue="10")Integer rows, String bookName, Model model) {
    return "redirect:/book/list.action";
  }
}
