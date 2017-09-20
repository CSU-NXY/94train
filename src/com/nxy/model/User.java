package com.nxy.model;

import com.sun.istack.internal.Nullable;

public class User {
    private int UserID=-1;
    private String PhoneNum;
    //不能getPassword
    private String Password;
    private String  ID;
    private String Name;
    private  String Email;

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int i)
    {
        UserID=i;
    }
    public String getPhoneNum() {
        return PhoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        PhoneNum = phoneNum;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String password) {
        Password = password;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String email) {
        Email = email;
    }

    public User()
    {
        //自己Set方法加...
    }




}
