package com.po;

import java.sql.Date;

/**
 * Created by zsq on 25/3/15.
 * User Profile
 */
public class UserProfile {
    private String name;
    private String gender;
    private Date birthday;
    private Date registerDate;

    public UserProfile() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }
}

enum Gender {
    MALE, FEMALE
}