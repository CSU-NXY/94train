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
    { }


    public User(int userId,String name){
        this.UserID = userId;
        this.Name = name;
    }
    public User(String phoneNum,String password,String email){
        this.PhoneNum = phoneNum;
        this.Password = password;
        this.Email = email;
    }

    public User(String name,String ID){
        this.Name = name;
        this.ID = ID;
    }

    public User(User user1,User user2){
        this.PhoneNum = user1.PhoneNum;
        this.Password = user1.Password;
        this.Email = user1.Email;

        this.Name = user2.Name;
        this.ID = user2.ID;
    }




}
