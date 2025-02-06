package com.office.clothes.list;

import lombok.Data;

@Data
public class ListVo {

	int user_no;
	int goodsId;
	String goodsName;
	String goodsColor;
	String goodsSize;
	int goodsSale;
	int goodsCnt; // 수량 몇개 살건지
	int totalPrice;
	String goodsImg1;

}
