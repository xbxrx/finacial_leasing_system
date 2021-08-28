package com.team01.service.impl;

import com.team01.dao.IStatisticDao;
import com.team01.domain.typeAndTotalPrice;
import com.team01.service.ISatisticInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service("statisticService")
public class StatisticServiceImpl implements ISatisticInfoService {
    @Autowired
    IStatisticDao iStatisticDao;
    @Override
    public List<typeAndTotalPrice> selectTypeAndTotalPrice() {
        return iStatisticDao.selectTypeAndTotalPrice();
    }
}
