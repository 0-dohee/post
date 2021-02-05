package com.example.controller;

import java.io.*;
import java.nio.file.*;

import javax.annotation.*;

import org.springframework.beans.factory.annotation.*;
import org.springframework.http.*;
import org.springframework.stereotype.*;
import org.springframework.ui.*;
import org.springframework.util.*;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.*;

import com.example.domain.*;
import com.example.mapper.*;
import com.example.service.*;

@Controller
public class PostController {
	@Autowired
	PostService service;
	
	@Autowired
	PostMapper mapper;
	
	@Resource(name="uploadPath")
	private String path;
	
	@RequestMapping("/")
	public String indexList(Model model) {
		model.addAttribute("indexList", mapper.indexList());
		
		return "index";
	}
	
	@RequestMapping("/post/list")
	public void list(Model model, Criteria cri) {
		cri.setPerPageNum(10);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setDisplayPageNum(10);
		pm.setTotalCount(mapper.totalCount(cri));
		
		model.addAttribute("list", mapper.list(cri));
		model.addAttribute("cri", cri);
		model.addAttribute("pm", pm);
	}

	// �̹������� �������� ���
	@RequestMapping("/post/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName) throws Exception {
		ResponseEntity<byte[]> result = null;
		// display fileName�� �ִ� ���
		if (!fileName.equals("")) {
			File file = new File(path + File.separator + fileName);
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}	
	
	@RequestMapping("/post/insert")
	public void insert() {
	}
	
	@RequestMapping(value="/post/insert", method=RequestMethod.POST)
	public String insert(PostVO vo, MultipartHttpServletRequest multi) throws Exception {

		MultipartFile file=multi.getFile("file");
		
		// ���� ���ε�
		if(!file.isEmpty()) { // ���ε� ������ ������� ������
			String image=System.currentTimeMillis() + "_" + file.getOriginalFilename(); // ���ϸ��� �ߺ������ʰ� �ϱ����ؼ� currentTimeMillis
			file.transferTo(new File(path + File.separator + image));
			vo.setImage(image);
			
		}
		mapper.insert(vo);
		//System.out.println(vo.toString());
		return "redirect:list";
	}
	
	@RequestMapping("/post/read")
	public void read(int bno, Model model, Criteria cri) {
		model.addAttribute("cri", cri);
		model.addAttribute("vo", service.read(bno));
	}
	
	@RequestMapping("/post/update")
	public void update(int bno, Model model, Criteria cri) {
		model.addAttribute("cri", cri);
		model.addAttribute("vo", mapper.read(bno));
	}
	
	@RequestMapping(value="/post/update", method=RequestMethod.POST)
	public String update(PostVO vo, Criteria cri, MultipartHttpServletRequest multi) throws Exception {
		System.out.println(vo.toString());
		
		MultipartFile file = multi.getFile("file");

		// ���Ͼ��ε�
		if (!file.isEmpty()) { // ���ε� ������ ������� ������
			
			// �����̹����� ������ ����
			String oldImage=vo.getImage();
			if(!oldImage.equals("")) {
				new File(path + File.separator + oldImage).delete();
			}
			
			String image = System.currentTimeMillis() + file.getOriginalFilename(); // ���ϸ��� �ߺ������ʰ� �ϱ����ؼ� currentTimeMillis
			file.transferTo(new File(path + File.separator + image));
			vo.setImage(image);
		}
		
		mapper.update(vo);
		int bno=vo.getBno();
		int page=cri.getPage();
		String searchType=cri.getSearchType();
		String keyword=cri.getKeyword();
		
		return "redirect:read?page="+page+"&bno="+bno+"&searchType="+searchType+"&keyword="+keyword;
	}
	
	@RequestMapping(value="/post/delete", method=RequestMethod.POST)
	public String delete(PostVO vo, Criteria cri) {
		
		// ���ϻ���
		String oldImage=vo.getImage();
		if(!oldImage.equals("")) {
			new File(path + File.separator + oldImage).delete();
		}
			
		mapper.delete(vo.getBno());
		int page=cri.getPage();
		String searchType=cri.getSearchType();
		String keyword=cri.getKeyword();
		return "redirect:list?page="+page+"&searchType="+searchType+"&keyword="+keyword;
	}
}
