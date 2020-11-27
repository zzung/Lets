package com.kh.ee.user.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.review.model.dao.ReviewDao;
import com.kh.ee.user.review.model.vo.Review;



@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private ReviewDao revDao;

	@Override
	public ArrayList<Review> selectReviewList(int lessonNo) {
	
		return revDao.selectReviewList(lessonNo,ss);
	}
	
	/*
	@Override
	public ArrayList<Reply> selectReplyReviewList(int reviewNo) {
	
		return revDao.selectReplyReviewList(reviewNo, ss);
	}*/

	@Override
	public int insertReview(Review r) {
		
		return revDao.insertReview(r,ss);
	}

	@Override
	public int insertReplyReview(Review r) {

		return revDao.insertReplyReview(r,ss);
	}

	@Override
	public int updateReview(Review r) {
		return revDao.updateReview(r, ss);
	}

	@Override
	public int updateReviewReply(Review r) {
		return revDao.updateReviewReply(r, ss);
	}
	
	@Override
	public int deleteReview(int reviewNo) {
		
		return revDao.deleteReview(reviewNo, ss);
	}


	@Override
	public int deleteReviewReply(int reviewNo) {
		return revDao.deleteReviewReply(reviewNo,ss);
	}




	

}
