package com.App.users.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;

import com.App.users.model.User;


public interface UserService {
	public UserDetails loadUserByUsername(final String username);
	public User findById(Integer id) ;
	
	public List<User> listUser();
	public void saveUser(User user);
	public User getUser(Integer id);
	public void deleteUser(Integer id);


}
