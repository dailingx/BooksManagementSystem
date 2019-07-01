package com.dxl.core.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dxl.core.dao.UserDao;
import com.dxl.core.po.User;
import com.dxl.core.service.UserService;

@Service
@Transactional
public class UserServiceImpl implements UserService{

  @Autowired
  private UserDao UserDao;
  @Override
  public User findUser(String username, String password) {
    User user = this.UserDao.findUser(username, password);
    return user;
  }
  
}
