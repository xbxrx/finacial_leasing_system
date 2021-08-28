package com.team01.service.impl;

import com.team01.dao.IStatisticDao;
import com.team01.domain.typeAndTotalPrice;
import com.team01.domain.Statistic;
import com.team01.service.ISatisticInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("statisticInfoService")
public class StatisticServiceImpl implements ISatisticInfoService {
    @Autowired
    IStatisticDao statisticDao;

    @Override
    public List<Statistic> statisticByRentTotal() {
        return statisticDao.statisticByRentTotal();
    }

    @Override
    public List<typeAndTotalPrice> selectTypeAndTotalPrice() {
        return statisticDao.selectTypeAndTotalPrice();
    }
}
