package com.expedition.service;

import com.expedition.dao.UserDAO;
import com.expedition.utils.PasswordUtil;

public class LoginService {

	public boolean loginUser(String email, String plainPassword) throws Exception {
		UserDAO dao = new UserDAO();

		String storedHashedPassword = dao.getPassword(email);

		if (storedHashedPassword == null) {
			return false;
		}

		return PasswordUtil.checkPassword(plainPassword, storedHashedPassword);
	}
}