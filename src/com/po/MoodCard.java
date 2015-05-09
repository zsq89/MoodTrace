package com.po;

import java.sql.Date;
import java.sql.Time;

/**
 * Created by zsq on 29/3/15.
 */
public class MoodCard {
    private int[] mood=new int[4];
    private Date recordDate;
    private Time recordTime;
    private String remark;

    public MoodCard() {
    }

    public int[] getMood() {
        return mood;
    }

    public void setMood(int[] mood) {
        System.arraycopy(mood, 0, this.mood, 0, mood.length);
    }

    public double getMoodValue() {
        double value=0;
        int weightSum=0;
        int[] weights={3,6,-3,-6};
        for(int i=0;i<mood.length;i++){
            value+=weights[i]*mood[i];
            if (weights[i]>0){
                weightSum+=weights[i];
            }

        }
        value=value/weightSum;
        return value;
    }



    public Date getRecordDate() {
        return recordDate;
    }

    public void setRecordDate(Date recordDate) {
        this.recordDate = recordDate;
    }

    public Time getRecordTime() {
        return recordTime;
    }

    public void setRecordTime(Time recordTime) {
        this.recordTime = recordTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}

