package com.team01.dao;

import com.team01.domain.AdminInfo;
import org.apache.ibatis.annotations.Param;

public interface IAdminInfoDao {
    public AdminInfo queryByNameAndPassword(@Param("adminName")String adminName, @Param("adminPassword")String adminPassword);

}
