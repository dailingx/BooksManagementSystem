package com.dxl.core.service;

import com.dxl.core.po.User;

public interface UserService {
  public User findUser(String username, String password);
}
