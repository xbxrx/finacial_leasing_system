package com.team01.service;

import com.team01.domain.AdminInfo;

public interface IAdiminInfoService {
    public AdminInfo queryByNameAndPassword(String adminName,String adminPassword);
}
