package com.springapp.bulletinboard.dao;

import com.springapp.bulletinboard.Advert;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AdvertDAOImpl implements AdvertDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void save(Advert ad) {
        sessionFactory.getCurrentSession().save(ad);
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Advert> findAll() {
        return sessionFactory.getCurrentSession().createQuery("FROM adverts").list();
    }

    @Override
    public void delete(Long id) {
        Advert ad = (Advert) sessionFactory.getCurrentSession().load(Advert.class, id);
        if (null != ad) {
            sessionFactory.getCurrentSession().delete(ad);
        }
    }
}
