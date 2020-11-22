package com.kh.ee.user.review.model.service;

import java.util.ArrayList;

import com.kh.ee.user.review.model.vo.Review;

public interface ReviewService {
	
	//후기 전체 리스트 가져오기
	ArrayList<Review> selectReviewList(int lessonNo);
	
	//후기 작성하기
	int insertReview(Review r);
	
	//후기 답장하기
	int replyReview(Review r); 
	
	//후기 수정하기
	int updateReview(Review r); 
	
	//후기 삭제하기
	int deleteReview(int reviewNo);
	
	//후기 답장 수정하기
	int replyUpdateReview(Review r);
	
	//후기 답장 삭제하기
	int replyDeleteReview();


}
