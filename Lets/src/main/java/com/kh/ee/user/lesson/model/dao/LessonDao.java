package com.kh.ee.user.lesson.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.review.model.vo.Review;
import com.kh.ee.user.tutor.model.vo.Tutor;

@Repository
public class LessonDao {

	public ArrayList<Lesson> selectApproveLessonList(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectApproveLessonList");
	}
	
	public ArrayList<Lesson> selectApproveStatusList(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectApproveStatusList");
	}
	
	//상세페이지에서 보여질 후기 리스트 (학천)
	public ArrayList<Review> selectReview(int lessonNo, SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectReview",lessonNo);
	}
	
	//상세페이지에서 보여질 FAQ (학천)
	public ArrayList<LessonFaq> selectLessonFaqList(int lessonNo, SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectLessonFaqList",lessonNo);
	}

	public Tutor selectTutorInfo(int lessonNo, SqlSessionTemplate ss) {
		return ss.selectOne("lessonMapper.selectTutorInfo",lessonNo);
	}
	
	public int deleteLesson(SqlSessionTemplate ss, int lno) {
		return ss.update("lessonMapper.deleteLesson", lno);
	}

	//상세페이지에서 보여질 커뮤니티 카운트(학천)
	public int selectListCount(SqlSessionTemplate ss) {
		return ss.selectOne("lessonMapper.selectListCount");
	}

	//상세페이지에서 보여질 커뮤니티 리스트(학천)
	public ArrayList<Reply> selectReply(int lessonNo, SqlSessionTemplate ss) {
		
		return (ArrayList)ss.selectList("lessonMapper.selectReply", lessonNo);
	}

	//상세페이지에서 보여질 커뮤니티 작성 (학천)
	public int insertReply(Reply r, SqlSessionTemplate ss) {
		return ss.insert("lessonMapper.insertReply",r);
	}

}
