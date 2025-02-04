package com.office.clothes.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	MemberDao memberDao;

	public MemberVo loginConfirm(String user_id, String pwd) {

		return memberDao.loginConfirm(user_id, pwd);
	}

	public int createConfirm(MemberVo memberVo) {

		return memberDao.createConfirm(memberVo);
	}

	public int dropConfirm(MemberVo memberVo, MemberVo loginedMemberVo) {

		return memberDao.dropConfirm(memberVo, loginedMemberVo);
	}

	public int modifyConfirm(MemberVo memberVo) {

		return memberDao.modifyConfirm(memberVo);
	}

	public MemberVo getUser(String user_id) {

		return memberDao.getUser(user_id);
	}

	public int modifyPwdConfirm(String user_id, String new_pwd) {

		return memberDao.modifyPwdConfirm(user_id, new_pwd);
	}

}
