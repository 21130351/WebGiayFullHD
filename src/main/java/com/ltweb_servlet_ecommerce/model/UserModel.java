package com.ltweb_servlet_ecommerce.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.Timestamp;
import java.util.Date;


public class UserModel extends AbstractModel<UserModel> {
    private  String userName;
    private String  email;
    private  String password;
    private  String fullName;
    private String birthDay;
    private Timestamp lastLogged;
    private String association = "none";
    private String role;
    private Boolean admin;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public Timestamp getLastLogged() {
        return lastLogged;
    }

    public void setLastLogged(Timestamp lastLogged) {
        this.lastLogged = lastLogged;
    }

    public String getAssociation() {
        return association;
    }

    public void setAssociation(String association) {
        this.association = association;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public Boolean getAdmin() {
        return (this.role != null && this.role.equalsIgnoreCase("admin"));
    }

}
