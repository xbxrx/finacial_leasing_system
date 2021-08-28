package com.team01.dao;

import com.team01.domain.typeAndTotalPrice;

import java.util.List;

public interface IStatisticDao {
    public List<typeAndTotalPrice> selectTypeAndTotalPrice();
}
