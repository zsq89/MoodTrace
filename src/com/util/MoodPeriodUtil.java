package com.util;

import java.util.Calendar;
import java.util.Date;
/**
 * Created by zsq on 1/4/15.
 */
public class MoodPeriodUtil {
    public java.sql.Date[] getThisWeek(Date current){
        java.sql.Date[] thisWeek=new java.sql.Date[2];
        Calendar c = Calendar.getInstance();
        c.setTime(current);
        int i = c.get(Calendar.DAY_OF_WEEK) - c.getFirstDayOfWeek();
        c.add(Calendar.DATE, -i);
        Date start = c.getTime();
        c.add(Calendar.DATE, 6);
        Date end = c.getTime();
        thisWeek[0]=new java.sql.Date(start.getTime());
        thisWeek[1]=new java.sql.Date(end.getTime());
        return thisWeek;
    }

    public static void main(String[] args){
        MoodPeriodUtil util=new MoodPeriodUtil();
        java.sql.Date[] thisWeek;
        Date dt=new Date();
        thisWeek=util.getThisWeek(dt);
        System.out.println(thisWeek[0]);
        System.out.println(thisWeek[1]);
    }
}

