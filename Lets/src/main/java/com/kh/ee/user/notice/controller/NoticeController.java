package com.kh.ee.user.notice.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.common.template.pagination;
import com.kh.ee.user.notice.model.service.NoticeService;
import com.kh.ee.user.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeService nService;
	
	@RequestMapping("tutorNotice.no")
	public String tutorSelectNoticeList(@RequestParam(value="currentPage", defaultValue="1")int currentPage, Notice n, Model model) {
		
		int listCount = nService.tutorSelectNoticeListCount(n);
		
		PageInfo pi = pagination.getPageInfo(listCount, currentPage, 5, 10);
		
		ArrayList<Notice> noticeList = nService.tutorSelectNoticeList(n, pi);
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pi", pi);
		
		return "user/notice/tutorNoticeList";
	}
	
	@RequestMapping("tutorDetailNotice.no")
	public String tutorDetailNotice(Notice n, Model model) {
		
		// 조회수 증가
		int result = nService.increaseCount(n);
		
		if(result > 0) {
			
			Notice notice = nService.tutorDetailNotice(n);
			
			model.addAttribute("notice", notice);
			
			return "user/notice/tutorDetailNotice";
			
		} else {
			
			model.addAttribute("errorMsg", "해당하는 공지사항이 없습니다. 다시 확인해주세요.");
			
			return "user/common/errorPage";
			
		}
	}
}
