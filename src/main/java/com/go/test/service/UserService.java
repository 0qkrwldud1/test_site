package com.go.test.service;

import java.util.List;

import com.go.test.model.User;

public interface UserService {
	
	public void signUp(User user);
	
	public User findByUserId(String userId);
	
	public List<User> findAll();
	
	public void userUpdate(User user);
	
	public void delete(Long userCode);
	
}
