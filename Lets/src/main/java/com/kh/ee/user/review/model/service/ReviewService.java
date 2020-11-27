package com.kh.ee.user.review.model.service;

import java.util.ArrayList;

import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.review.model.vo.Review;

public interface ReviewService {
	
	//후기 전체 리스트 가져오기
	ArrayList<Review> selectReviewList(int lessonNo);
	//ArrayList<Reply> selectReplyReviewList(int reviewNo); 
	
	//후기 작성하기
	int insertReview(Review r);
	
	//후기 답장하기
	int insertReplyReview(Review r); 
	
	//후기 수정하기
	int updateReview(Review r); 
	
	//후기 댓글 수정하기
	int updateReviewReply(Review r); 
	
	//후기 삭제하기
	int deleteReview(int reviewNo);
	
	//후기 답장 삭제하기
	int deleteReviewReply(int reviewNo);
	

	


}
