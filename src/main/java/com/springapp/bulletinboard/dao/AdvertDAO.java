package com.springapp.bulletinboard.dao;

import com.springapp.bulletinboard.Advert;

import java.util.List;

public interface AdvertDAO {
    public void save(Advert ad);

    public List<Advert> findAll();

    public void delete(Long id);
}
