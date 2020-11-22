package com.kh.ee.user.member.model.service;

import com.kh.ee.user.member.model.vo.Member;

public interface MemberService {

	Member loginMember(Member m);
	int insertMember(Member m);

}
