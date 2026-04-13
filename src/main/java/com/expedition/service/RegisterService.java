package com.expedition.service;

import com.expedition.dao.UserDAO;
import com.expedition.utils.PasswordUtil;

public class RegisterService {

    public void addUser(String name, String email, String password, String phone_number) throws Exception {
        password=PasswordUtil.getHashPassword(password); // For hashing password
        UserDAO dao = new UserDAO();
        dao.insertUser(name, email, password, phone_number);
    }
}