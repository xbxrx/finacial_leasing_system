package com.team01.dao;

import com.team01.domain.AdminInfo;

public interface IAdminInfoDao {
    public AdminInfo queryByName(String adminName);

}
