package com.dxl.core.dao;

import org.apache.ibatis.annotations.Param;

import com.dxl.core.po.User;

public interface UserDao {
  public User findUser(@Param("username")String username, @Param("password")String password);
}
