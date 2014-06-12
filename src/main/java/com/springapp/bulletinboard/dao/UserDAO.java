package com.springapp.bulletinboard.dao;

import com.springapp.bulletinboard.User;

import java.util.List;

public interface UserDAO {
    public void save(User contact);

    public List<User> findAll();

    public User findOne(Long id);

    public void delete(Long id);
}
