package com.example.mapper;

import java.util.*;

import com.example.domain.*;

public interface PostMapper {
	// ���
    public ArrayList<PostVO> list(Criteria cri);
    
    // ���������� ���
    public ArrayList<PostVO> indexList();
    
    // ���
    public void insert(PostVO vo);
    
    // �б�
    public PostVO read(int bno);
    
    // ����
    public void update(PostVO vo);
    
    // ����
    public void delete(int bno);
    
    // ������
    public int totalCount(Criteria cri);
    
    // ��ȸ��
    public void updateViewCnt(int bno);
    
}
