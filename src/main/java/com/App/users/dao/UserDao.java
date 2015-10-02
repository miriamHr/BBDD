package com.App.users.dao;


import java.util.List;

import com.App.users.model.User;



public interface UserDao {
	User findByUserName(String username);

	
	//edit
	User findById(Integer id);
	public List<User> listUser();

	public User getUser(Integer id);
	public void deleteUser(Integer id);
	public void saveUser(User book);
	
	
}
