package com.team01.service;


import com.team01.domain.Statistic;
import java.util.List;
import com.team01.domain.typeAndTotalPrice;



public interface ISatisticInfoService {
    public List<Statistic> statisticByRentTotal();

    public List<typeAndTotalPrice> selectTypeAndTotalPrice();

}
