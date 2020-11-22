package com.kh.ee.user.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.review.model.vo.Review;

@Repository
public class ReviewDao {

	public ArrayList<Review> selectReviewList(int lessonNo, SqlSessionTemplate ss) {
		//System.out.println("lessonNo:" + lessonNo);
		return (ArrayList)ss.selectList("reviewMapper.selectReviewList", lessonNo);
	}

	public int deleteReview(int reviewNo, SqlSessionTemplate ss) {
		
		return ss.update("reviewMapper.deleteReview",reviewNo);
	}

	public int insertReview(Review r, SqlSessionTemplate ss) {

		return ss.insert("reviewMapper.insertReview",r);
	}

}
