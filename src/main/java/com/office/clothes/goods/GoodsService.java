package com.office.clothes.goods;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GoodsService {

	@Autowired
	GoodsDao goodsDao;

	public List<GoodsVo> home() {

		return goodsDao.home();
	}

}
