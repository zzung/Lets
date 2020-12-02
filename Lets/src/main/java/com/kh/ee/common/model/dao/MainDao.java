package com.kh.ee.common.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ee.user.lesson.model.vo.Lesson;

@Repository
public class MainDao {

	public ArrayList<Lesson> mainThumbnail(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("mainMapper.mainThumbnail");
	}

	public ArrayList<Lesson> kidsList(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("mainMapper.kidsList");
	}

	public ArrayList<Lesson> moneyList(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("mainMapper.moneyList");
	}

	public ArrayList<Lesson> hobbyList(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("mainMapper.hobbyList");
	}

	public ArrayList<Lesson> careerList(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("mainMapper.careerList");
	}

	public ArrayList<Lesson> newLessonList(SqlSessionTemplate ss) {
		return (ArrayList)ss.selectList("mainMapper.newLessonList");
	}

}
