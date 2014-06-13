package com.springapp.bulletinboard.service;

import com.springapp.bulletinboard.User;

import java.util.List;

public interface UserService {

    public void save(User user);

    public List<User> findAll();

    public void delete(Long id);
}
