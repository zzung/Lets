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
	public Review selectNumber(int lessonNo) {
		return revDao.selectNumber(lessonNo, ss);
	}
	
	@Override
	public ArrayList<Review> selectReviewList(int lessonNo) {
	
		return revDao.selectReviewList(lessonNo,ss);
	}
	

	@Override
	public int insertReview(Review r) {
		
		return revDao.insertReview(r,ss);
	}

	@Override
	public int insertReplyReview(Reply re) {

		return revDao.insertReplyReview(re,ss);
	}

	@Override
	public int updateReview(Review r) {
		return revDao.updateReview(r, ss);
	}

	@Override
	public int updateReviewReply(Reply re) {
		return revDao.updateReviewReply(re, ss);
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
