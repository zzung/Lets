package com.kh.ee.user.notice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.ee.user.notice.model.service.NoticeService;
import com.kh.ee.user.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@RequestMapping("tutorNotice.no")
	public String tutorSelectNoticeList(Model model) {
		return "user/notice/tutorNoticeList";
	}
	
	@RequestMapping("tutorDetailNotice.no")
	public String tutorDetailNotice(Notice n, Model model) {
		return "user/notice/tutorDetailNotice";
	}
}
