package kr.co.itcen.fa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.itcen.fa.repository.UserRepository;
import kr.co.itcen.fa.vo.UserVo;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository;
	
	public UserVo getUser(UserVo vo) {
		return userRepository.findByIdAndPassword(vo);
	}

	public void addUser(UserVo userVo) {
		userRepository.save(userVo);
	}
	
	public List<UserVo> getAllUser(){
		return userRepository.findAll();
	}
}
