package com.example.mapper;

import java.util.*;

import com.example.domain.*;

public interface PostMapper {
	// 목록
    public ArrayList<PostVO> list(Criteria cri);
    
    // 메인페이지 목록
    public ArrayList<PostVO> indexList();
    
    // 등록
    public void insert(PostVO vo);
    
    // 읽기
    public PostVO read(int bno);
    
    // 수정
    public void update(PostVO vo);
    
    // 삭제
    public void delete(int bno);
    
    // 페이지
    public int totalCount(Criteria cri);
    
    // 조회수
    public void updateViewCnt(int bno);
    
}
