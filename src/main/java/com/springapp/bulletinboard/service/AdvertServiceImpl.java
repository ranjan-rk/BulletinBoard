package com.springapp.bulletinboard.service;

import com.springapp.bulletinboard.Advert;
import com.springapp.bulletinboard.dao.AdvertDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class AdvertServiceImpl implements AdvertService {

    @Autowired
    private AdvertDAO advertDao;

    @Transactional
    public void save(Advert ad) {
        advertDao.save(ad);
    }

    @Transactional
    public List<Advert> findAll() {
        return advertDao.findAll();
    }

    @Transactional
    public void delete(Long id) {
        advertDao.delete(id);
    }
}
