package com.kh.ee.user.member.model.service;

import com.kh.ee.user.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);
	int insertMember(Member m);
	int idCheck(String memId);
	int nicknameCheck(String nickname);
	Member findId(Member m);
	Member selectMember(String memId);
	int updatePwd(Member m);

}
