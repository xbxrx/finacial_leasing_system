package com.team01.dao;

import com.team01.domain.Statistic;
import java.util.List;
import com.team01.domain.typeAndTotalPrice;


public interface IStatisticDao {
    public List<Statistic> statisticByRentTotal();

    public List<typeAndTotalPrice> selectTypeAndTotalPrice();
}
