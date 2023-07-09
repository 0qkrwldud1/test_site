package com.go.test.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.go.test.model.User;
import com.go.test.repository.UserRepository;

@Service
public class UserServiceImp implements UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	@Override
	public void signUp(User user) {
		userRepository.save(user);
	}
	
	@Override
	public User findByUserId (String userId) {
		return userRepository.findByUserId(userId);
	}
	
	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}
	
	@Transactional
	@Override
	public void userUpdate(User user) {
		
		User u = userRepository.findByUserId(user.getUserId());
		u.setUserPwd(user.getUserPwd());
		u.setUserName(user.getUserName());
		u.setUserEmail(user.getUserEmail());
		u.setUserPhone(user.getUserPhone());
		u.setDepCode(user.getDepCode());
		u.setUserUpdate(new Date());
	}
	
	@Override
	public void delete(Long userCode) {
		userRepository.deleteById(userCode);
	}
	
}
