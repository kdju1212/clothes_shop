package com.office.clothes.list;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.office.clothes.HomeVo;
import com.office.clothes.member.MemberVo;

@Repository
public class ListDao {

	@Autowired
	JdbcTemplate jdbcTemplate;

	public int setCartProduct(MemberVo loginedMemberVo, ListVo listVo) {

		String sql = "insert into cart values(?,?,?,?,?,?,?,?)";

		return jdbcTemplate.update(sql, loginedMemberVo.getUser_no(), listVo.getGoodsId(), listVo.getGoodsName(),
				listVo.getGoodsSale(), listVo.getGoodsColor(), listVo.getGoodsSize(), listVo.getGoodsCnt(),
				listVo.getGoodsImg1());

	}

	public List<ListVo> getCartProduct(MemberVo loginedMemberVo) {

		String sql = "select * from cart where user_no = ?";

		RowMapper<ListVo> rowMapper = new BeanPropertyRowMapper<>(ListVo.class);

		return jdbcTemplate.query(sql, rowMapper, loginedMemberVo.getUser_no());
	}

	public List<ListVo> getGoodsListByUserId(int user_no) {
		// 1. user_id가 1인 상품의 goodsId 리스트 가져오기
		List<Integer> goodsIds = jdbcTemplate.queryForList("SELECT goodsId FROM cart WHERE user_no = ?", Integer.class,
				user_no);

		// 2. goodsId 목록을 기반으로 한 번의 쿼리로 goods 정보 가져오기
		String sql = "SELECT * FROM goods WHERE goodsId IN ("
				+ String.join(",", Collections.nCopies(goodsIds.size(), "?")) + ")";

		RowMapper<ListVo> rowMapper = new BeanPropertyRowMapper<>(ListVo.class);

		// goodsIds를 Object[]로 캐스팅하여 전달
		List<ListVo> goodsList = jdbcTemplate.query(sql, rowMapper, // RowMapper 전달
				goodsIds.toArray(new Object[0]) // Integer[]를 Object[]로 캐스팅하여 전달
		);

		return goodsList;
	}

	public int getCartProductZero(MemberVo loginedMemberVo, ListVo listVo) {
		// 1. 단일 조회를 위한 SQL
		String sql = "SELECT COUNT(*) FROM cart WHERE user_no = ? AND goodsId = ? AND goodsColor = ? AND goodsSize = ?";

		Integer result = jdbcTemplate.queryForObject(sql, Integer.class, loginedMemberVo.getUser_no(),
				listVo.getGoodsId(), listVo.getGoodsColor(), listVo.getGoodsSize());

		return result != null ? result : 0;
	}

	public int updateCartProduct(MemberVo loginedMemberVo, ListVo listVo) {
		String sql = "UPDATE cart SET goodsCnt = goodsCnt + ? WHERE user_no = ? AND goodsId = ? AND goodsColor = ? AND goodsSize = ?";

		return jdbcTemplate.update(sql, listVo.getGoodsCnt(), loginedMemberVo.getUser_no(), listVo.getGoodsId(),
				listVo.getGoodsColor(), listVo.getGoodsSize());
	}

	public int goodsInsert(HomeVo homeVo) {

		String sql = "insert into goods values(goods_seq.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE)";
		int result = jdbcTemplate.update(sql, homeVo.getGoodsName(), homeVo.getGoodsCategory(),
				homeVo.getGoodsContent(), homeVo.getGoodsSize(), homeVo.getGoodsColor(), homeVo.getGoodsPrice(),
				homeVo.getGoodsSale(), homeVo.getGoodsInventory(), 0, homeVo.getGoodsImg1(), homeVo.getGoodsImg2(),
				homeVo.getGoodsImg3());
		;

		return result;
	}

	public List<HomeVo> category(String category) {

		String sql = "select * from goods where goodscategory = ?";

		RowMapper<HomeVo> rowMapper = new BeanPropertyRowMapper<>(HomeVo.class);

		// 쿼리 실행: 댓글 목록 가져오기
		return jdbcTemplate.query(sql, rowMapper, category);
	}

}
