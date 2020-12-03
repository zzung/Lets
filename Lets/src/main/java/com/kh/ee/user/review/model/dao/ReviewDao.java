package com.kh.ee.user.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.review.model.vo.Review;

@Repository
public class ReviewDao {
	
	//후기 더보기에서 보여질 전체 후기 리스트 
	public ArrayList<Review> selectReviewList(int lessonNo, SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("reviewMapper.selectReviewList", lessonNo);
	}
	
	/*
	public ArrayList<Reply> selectReplyReviewList(int reviewNo, SqlSessionTemplate ss) {
		System.out.println("revNo:" + reviewNo);
		return (ArrayList)ss.selectList("reviewMapper.selectReplyReviewList",reviewNo);
	}*/


	public int insertReview(Review r, SqlSessionTemplate ss) {

		return ss.insert("reviewMapper.insertReview",r);
	}
	
	public int insertReplyReview(Reply re, SqlSessionTemplate ss) {
		
		return ss.insert("reviewMapper.insertReplyReview",re);
	}

	public int updateReview(Review r, SqlSessionTemplate ss) {
		return ss.update("reviewMapper.updateReview", r);
	}

	public int updateReviewReply(Reply re, SqlSessionTemplate ss) {
		return ss.update("reviewMapper.updateReviewReply",re);
	}
	

	public int deleteReview(int reviewNo, SqlSessionTemplate ss) {
		
		return ss.update("reviewMapper.deleteReview",reviewNo);
	}
	
	public int deleteReviewReply(int reviewNo, SqlSessionTemplate ss) {

		return ss.update("reviewMapper.deleteReviewReply",reviewNo);
	}

	public Review selectNumber(int lessonNo, SqlSessionTemplate ss) {
		return ss.selectOne("reviewMapper.selectNumber",lessonNo);
	}




}
