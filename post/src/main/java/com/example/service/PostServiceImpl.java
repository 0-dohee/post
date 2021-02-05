package com.example.service;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.transaction.annotation.*;

import com.example.domain.*;
import com.example.mapper.*;

@Service
public class PostServiceImpl implements PostService {
	@Autowired
	PostMapper mapper;
	
	@Transactional
	@Override
	public PostVO read(int bno) {
		mapper.updateViewCnt(bno);
		return mapper.read(bno);
	}
}
