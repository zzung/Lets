package com.kh.ee.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.common.template.Pagination;
import com.kh.ee.user.notice.model.service.NoticeService;
import com.kh.ee.user.notice.model.vo.Notice;

@Controller
public class AdminNoticeController {

	public String adminNoticeList() {
		return ;
	}
	
	public String adminNoticeUpdate(Notice n) {
		return;
	}
	
	public String adminNoticeDelete(Notice n) {
		return;
	}
	
	public String adminNoticeInsert(Notice n) {
		return;
	}
	
	
	
	
}
