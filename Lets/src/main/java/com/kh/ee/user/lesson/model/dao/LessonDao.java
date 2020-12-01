package com.kh.ee.user.lesson.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.common.model.vo.PageInfo;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.reply.model.vo.Reply;
import com.kh.ee.user.report.model.vo.Report;
import com.kh.ee.user.review.model.vo.Review;
import com.kh.ee.user.tutor.model.vo.Tutor;

@Repository
public class LessonDao {

	public ArrayList<Lesson> selectApproveLessonList(SqlSessionTemplate ss, int memNo) {
		return (ArrayList)ss.selectList("lessonMapper.selectApproveLessonList", memNo);
	}
	
	public ArrayList<Lesson> selectApproveStatusList(SqlSessionTemplate ss, int memNo) {
		return (ArrayList)ss.selectList("lessonMapper.selectApproveStatusList", memNo);
	}
	
	//상세페이지 레슨 보여주기(학천)
	public Lesson selectLessonList(int lessonNo, SqlSessionTemplate ss) {
		return ss.selectOne("lessonMapper.selectLessonList",lessonNo);
	}
	
	//상세페이지에서 보여질 후기 리스트 (학천)
	public ArrayList<Review> selectReview(int lessonNo, SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectReview",lessonNo);
	}
	
	//상세페이지에서 보여질 FAQ (학천)
	public ArrayList<LessonFaq> selectLessonFaqList(int lessonNo, SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectLessonFaqList",lessonNo);
	}

	//상세페이지에서 보여질 커뮤니티 카운트(학천)
	public int selectListCount(SqlSessionTemplate ss) {
		return ss.selectOne("lessonMapper.selectListCount");
	}

	//상세페이지에서 보여질 커뮤니티 리스트(학천)
	public ArrayList<Reply> selectReply(int lessonNo, SqlSessionTemplate ss) {
		
		return (ArrayList)ss.selectList("lessonMapper.selectReply", lessonNo);
	}

	// 커뮤니티 댓글 작성 (학천)
	public int insertReply(Reply r, SqlSessionTemplate ss) {
		return ss.insert("lessonMapper.insertReply",r);
	}
	//커뮤니티 댓글 삭제 (학천)
	public int deleteReply(int replyNo, SqlSessionTemplate ss) {
		return ss.update("lessonMapper.deleteReply",replyNo);
	}
	
	//커뮤니티 댓글 수정 (학천)
	public int updateReply(Reply r, SqlSessionTemplate ss) {
		return ss.update("lessonMapper.updateReply",r);
	}

	//커뮤니티 대댓글 등록 (학천)
	public int insertReReply(Reply r, SqlSessionTemplate ss) {
		return ss.insert("lessonMapper.insertReReply",r);
	}
	
	//커뮤니티 대댓글 삭제 (학천)
	public int deleteReReply(Reply r, SqlSessionTemplate ss) {
		return ss.update("lessonMapper.deleteReReply",r);
	}

	public Tutor selectTutorInfo(int lessonNo, SqlSessionTemplate ss) {
		return ss.selectOne("lessonMapper.selectTutorInfo",lessonNo);
	}
	
	public int deleteLesson(SqlSessionTemplate ss, int lno) {
		return ss.update("lessonMapper.deleteLesson", lno);
	}

	public int updateReReply(Reply r, SqlSessionTemplate ss) {
		return ss.update("lessonMapper.updateReReply",r);
	}

	public int reportReply(Report rpt, SqlSessionTemplate ss) {
		return ss.insert("lessonMapper.reportReply",rpt);
	}
	
	/*
	public int likeCount(int lessonNo, SqlSessionTemplate ss) {
		return ss.update("lessonMapper.likeCount",lessonNo);
	}
	*/

}
