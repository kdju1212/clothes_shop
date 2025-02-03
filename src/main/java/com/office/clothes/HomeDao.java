package com.office.clothes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class HomeDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<HomeVo> home() {

		String sql = "select * from employees";
		RowMapper<HomeVo> rowMapper = new BeanPropertyRowMapper<>(HomeVo.class);

		// 쿼리 실행: 댓글 목록 가져오기
		return jdbcTemplate.query(sql, rowMapper);
	}

}
