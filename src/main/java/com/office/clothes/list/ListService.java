package com.office.clothes.list;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.office.clothes.HomeVo;
import com.office.clothes.member.MemberVo;

@Service
public class ListService {

	@Autowired
	ListDao listDao;

	public int setCartProduct(MemberVo loginedMemberVo, ListVo listVo) {

		return listDao.setCartProduct(loginedMemberVo, listVo);
	}

	public List<ListVo> getCartProduct(MemberVo loginedMemberVo) {

		return listDao.getCartProduct(loginedMemberVo);
	}

	public List<ListVo> getGoodsListByUserId(MemberVo loginedMemberVo) {

		return listDao.getGoodsListByUserId(loginedMemberVo.getUser_no());
	}

	public int getCartProductZero(MemberVo loginedMemberVo, ListVo listVo) {

		return listDao.getCartProductZero(loginedMemberVo, listVo);
	}

	public int updateCartProduct(MemberVo loginedMemberVo, ListVo listVo) {

		return listDao.updateCartProduct(loginedMemberVo, listVo);
	}

	public int goodsInsert(HomeVo recipe) {
		return listDao.goodsInsert(recipe);

	}
}
