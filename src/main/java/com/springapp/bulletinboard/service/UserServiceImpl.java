package com.springapp.bulletinboard.service;

import com.springapp.bulletinboard.User;
import com.springapp.bulletinboard.dao.UserDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDao;

    @Transactional
    public void save(User user) {
        userDao.save(user);
    }

    @Transactional
    public List<User> findAll() {
        return userDao.findAll();
    }

    @Transactional
    public void delete(Long id) {
        userDao.delete(id);
    }
}
