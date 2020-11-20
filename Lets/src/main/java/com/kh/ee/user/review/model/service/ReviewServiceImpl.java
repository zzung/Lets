package com.kh.ee.user.review.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ee.user.review.model.dao.ReviewDao;
import com.kh.ee.user.review.model.vo.Review;



@Service
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private SqlSessionTemplate ss;
	
	@Autowired
	private ReviewDao revDao;

	@Override
	public ArrayList<Review> showMoreReview(int lessonNo) {
	
		return revDao.showMoreReview(lessonNo,ss);
	}

	@Override
	public int insertReview(Review r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyReview(Review r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateReview(Review r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteReview(int reviewNo) {
		
		return revDao.deleteReview(reviewNo, ss);
	}

	@Override
	public int replyUpdateReview(Review r) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int replyDeleteReview() {
		// TODO Auto-generated method stub
		return 0;
	}

}
