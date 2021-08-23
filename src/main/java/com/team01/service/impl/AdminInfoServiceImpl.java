package com.team01.service.impl;

import com.team01.dao.IAdminInfoDao;
import com.team01.domain.AdminInfo;
import com.team01.service.IAdiminInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("adminInfoService")
public class AdminInfoServiceImpl implements IAdiminInfoService {
    @Autowired
    IAdminInfoDao iAdminInfoDao;

    @Override
    public AdminInfo queryByName(String adminName) {
      return iAdminInfoDao.queryByName(adminName);
    }
}
