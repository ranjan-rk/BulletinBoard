package com.springapp.bulletinboard.dao;

import com.springapp.bulletinboard.User;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class UserDAOImpl implements UserDAO {

    final static String GET_ONE_USER_QUERY = "SELECT u FROM users u WHERE u.id = :id";

    @Autowired
    private SessionFactory sessionFactory;

    public void save(User user) {
        sessionFactory.getCurrentSession().save(user);
    }

    @SuppressWarnings("unchecked")
    public List<User> findAll() {
        return sessionFactory.getCurrentSession().createQuery("FROM users").list();
    }

    public User findOne(Long id) {
        Query getOneUserQuery = sessionFactory.getCurrentSession().createQuery(GET_ONE_USER_QUERY).setParameter("id", id);
        List<User> users = getOneUserQuery.list();
        if (users.size() == 1) {
            users.get(0);
        }
        // throw exception or smthng like that
        return new User();
    }

    public void delete(Long id) {
        User user = (User) sessionFactory.getCurrentSession().load(User.class, id);
        if (null != user) {
            sessionFactory.getCurrentSession().delete(user);
        }
    }
}
