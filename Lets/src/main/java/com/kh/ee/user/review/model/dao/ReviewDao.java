package com.kh.ee.user.review.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.review.model.vo.Review;

@Repository
public class ReviewDao {

	public ArrayList<Review> showMoreReview(SqlSessionTemplate ss) {
		
		return (ArrayList)ss.selectList("reviewMapper.showMoreReview");
	}

	public int deleteReview(int reviewNo, SqlSessionTemplate ss) {
		
		return ss.update("reviewMapper.deleteReview",reviewNo);
	}

	//삭제하기
}
