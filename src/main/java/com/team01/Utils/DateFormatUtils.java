package com.team01.Utils;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateFormatUtils {
    public static int getMonthSpace (String startDate,String endDate) throws Exception {
        int monthCount = 0;

        Calendar startCalendar = Calendar.getInstance();
        Calendar endCalendar = Calendar.getInstance();

        startCalendar.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(startDate));
        endCalendar.setTime(new SimpleDateFormat("yyyy-MM-dd").parse(endDate));

        int year = endCalendar.get(Calendar.YEAR) - startCalendar.get(Calendar.YEAR);
        int month = endCalendar.get(Calendar.MONTH) - startCalendar.get(Calendar.MONTH);
        int day = Math.abs(endCalendar.get(Calendar.DATE) - startCalendar.get(Calendar.DATE));

        if (year == 0 && month == 0){
            startCalendar.set(Calendar.DATE, 1);
            endCalendar.set(Calendar.DATE, 1);
            endCalendar.roll(Calendar.DATE, -1);
            if (day == (endCalendar.get(Calendar.DATE) - startCalendar.get(Calendar.DATE))) {
                monthCount = 1;// 两日期间满一个月
            } else {
                monthCount = 0;// 两日期间不足一个月
            }
        } else if (year != 0 && month == 0) {// 年份不同月份相同
            if (startCalendar.get(Calendar.DATE) < endCalendar.get(Calendar.DATE)) {// 两日期间的天数，小于等于当月
                monthCount = 1;
            }
            monthCount += year * 12 + month;
        } else {
            if (startCalendar.get(Calendar.DATE) >= endCalendar.get(Calendar.DATE)) {// 起始日期DATE 大于等于结束日期DATE
                monthCount = year * 12 + month;
            } else {
                monthCount = year * 12 + month + 1;
            }
        }
        return monthCount;
    }
}
