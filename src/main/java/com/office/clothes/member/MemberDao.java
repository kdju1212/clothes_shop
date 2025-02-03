package com.office.clothes.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {

	@Autowired
	JdbcTemplate jdbcTemplate;
	@Autowired
	private PasswordEncoder passwordEncoder;

	/* 로그인 확인 */
	/* 아이디로 비밀번호 확인 */
	public MemberVo loginConfirm(String user_id, String pwd) {

		// 비밀번호가 맞는지만 검색
		String sql = "select user_id, pwd from member where user_id = ?";

		try {
			// 데이터베이스에서 회원 정보 조회
			MemberVo member = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(MemberVo.class), user_id);

			// 입력된 비밀번호와 DB에서 조회된 비밀번호 비교
			if (passwordEncoder.matches(pwd, member.getPwd())) {
				// 비밀번호가 일치하면 회원 정보 반환

				// user정보 가져오기
				String getusersql = "select * from member where user_id = ?";
				MemberVo loginedMemberVo = jdbcTemplate.queryForObject(getusersql,
						new BeanPropertyRowMapper<>(MemberVo.class), user_id);

				return loginedMemberVo;
			} else {
				// 비밀번호 불일치 시 null 반환 또는 적절한 예외 처리
				return null;
			}
		} catch (EmptyResultDataAccessException e) {
			// 해당 user_id가 존재하지 않는 경우 예외 처리
			return null;
		}
	}

	/* 아이디로 user 찾기 */
	public MemberVo getUser(String user_id) {

		String sql = "select * from member where user_id = ?";

		MemberVo loginedMemberVo = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(MemberVo.class),
				user_id);

		return loginedMemberVo;
	}

	/* 회원가입 확인 */
	public int createConfirm(MemberVo memberVo) {
		String sql = "INSERT INTO member(user_no, user_id, pwd,name,age,gender, email, phone, cre_date, mod_date) "
				+ "VALUES(user_seq.NEXTVAL,?, ?, ?, ?, ?, ?, ?, SYSDATE, SYSDATE)";

		int result = -1;

		try {
			// reg_date와 mod_date는 전달하지 않음
			result = jdbcTemplate.update(sql, memberVo.getUser_id(), passwordEncoder.encode(memberVo.getPwd()),
					memberVo.getName(), memberVo.getAge(), memberVo.getGender(), memberVo.getEmail(),
					memberVo.getPhone());
		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/* 탈퇴 학인 */
	public int dropConfirm(MemberVo memberVo, MemberVo loginedMemberVo) {
		String sql = "delete from member where user_id = ?";

		int result = -1;

		try {

			MemberVo loginVo = loginConfirm(loginedMemberVo.getUser_id(), memberVo.getPwd());

			if (loginVo != null) {
				result = jdbcTemplate.update(sql, loginedMemberVo.getUser_id());
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

	/* 수정 확인 */
	public int modifyConfirm(MemberVo memberVo) {

		String sql = "update member set name = ?, email = ?, phone = ?, gender = ?, "
				+ "age = ? , mod_date = SYSDATE WHERE user_id = ?";

		int result = -1;

		try {

			result = jdbcTemplate.update(sql, memberVo.getName(), memberVo.getEmail(), memberVo.getPhone(),
					memberVo.getGender(), memberVo.getAge(), memberVo.getUser_id());

		} catch (Exception e) {
			e.printStackTrace();
		}

		return result;
	}

}
