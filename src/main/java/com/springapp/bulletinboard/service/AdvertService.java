package com.springapp.bulletinboard.service;

import com.springapp.bulletinboard.Advert;

import java.util.List;

public interface AdvertService {

    public void save(Advert ad);

    public List<Advert> findAll();

    public void delete(Long id);
}

