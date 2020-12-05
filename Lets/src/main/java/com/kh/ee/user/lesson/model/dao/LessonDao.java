package com.kh.ee.user.lesson.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.curriculum.model.vo.Curriculum;
import com.kh.ee.user.curriculum.model.vo.Video;
import com.kh.ee.user.lesson.model.vo.Lesson;
import com.kh.ee.user.lesson.model.vo.LessonFaq;
import com.kh.ee.user.lesson.model.vo.WishList;
import com.kh.ee.user.memPay.model.vo.MemPay;
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

	//키즈 화면에 뿌려줄것(학천)
	public ArrayList<Lesson> selectKidsPop(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectKidsPop");
	}
	public ArrayList<Lesson> selectKidsNew(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectKidsNew");
	}
	public ArrayList<Lesson> selectKidsDisc(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectKidsDisc");
	}
	public ArrayList<Lesson> selectKidsAll(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectKidsAll");
	}
	
	//머니 화면에 뿌려줄것(학천)
	public ArrayList<Lesson> selectMoneyPop(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectMoneyPop");
	}
	public ArrayList<Lesson> selectMoneyNew(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectMoneyNew");
	}
	public ArrayList<Lesson> selectMoneyDisc(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectMoneyDisc");
	}
	public ArrayList<Lesson> selectMoneyAll(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectMoneyAll");
	}

	//커리어 화면에 뿌려줄것(학천)
	public ArrayList<Lesson> selectCareerPop(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectCareerPop");
	}
	public ArrayList<Lesson> selectCareerNew(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectCareerNew");
	}
	public ArrayList<Lesson> selectCareerDisc(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectCareerDisc");
	}
	public ArrayList<Lesson> selectCareerAll(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectCareerAll");
	}
	
	//취미 화면에 뿌려줄것(학천)
	public ArrayList<Lesson> selectHobbyPop(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectHobbyPop");
	}
	public ArrayList<Lesson> selectHobbyNew(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectHobbyNew");
	}
	public ArrayList<Lesson> selectHobbyDisc(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectHobbyDisc");
	}
	public ArrayList<Lesson> selectHobbyAll(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("lessonMapper.selectHobbyAll");
	}

	public MemPay selectMemPayList(int lessonNo,SqlSessionTemplate ss) {
		return ss.selectOne("lessonMapper.selectMemPayList",lessonNo);
	}

	public int insertPayInfo(MemPay mp, SqlSessionTemplate ss) {
		return ss.insert("lessonMapper.insertPayInfo",mp);
	}

	public int insertDelInfo(MemPay mp, SqlSessionTemplate ss) {
		return ss.insert("lessonMapper.insertDelInfo",mp);
	}
	
	public int insertLessonFaq(LessonFaq lfaq, SqlSessionTemplate ss) {
		return ss.insert("lessonMapper.insertLessonFaq",lfaq);
	}

	public int insertCurriculum(Curriculum element, SqlSessionTemplate ss) {
		return ss.insert("curriculumMapper.insertCurriculum", element);
	}

	//(학천)
	public int likeCount(int lessonNo, SqlSessionTemplate ss) {
		return ss.update("lessonMapper.likeCount",lessonNo);
	}

	public int insertCount(WishList wl, SqlSessionTemplate ss) {
		return ss.insert("lessonMapper.insertCount",wl);
	}

	public int dislikeCount(int lessonNo, SqlSessionTemplate ss) {
		return ss.update("lessonMapper.dislikeCount",lessonNo);
	}

	public int insertVideo(Video element, SqlSessionTemplate ss) {
		return ss.insert("curriculumMapper.insertVideo", element);
	}
		
	public int deleteCount(WishList wl, SqlSessionTemplate ss) {
		return ss.delete("lessonMapper.deleteCount",wl);
	}

	public int selectWL(WishList wl, SqlSessionTemplate ss) {
		int result = ss.selectOne("lessonMapper.selectWL",wl);
			System.out.println("daoWl : " + result);
		return result;
	}

	public int insertLesson(Lesson l, SqlSessionTemplate ss) {
		return ss.insert("lessonMapper.insertLesson", l);
	}
}
