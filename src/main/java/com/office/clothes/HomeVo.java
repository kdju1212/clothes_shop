package com.office.clothes;

import lombok.Data;

@Data
public class HomeVo {

	int goodsId;
	String goodsName;
	String goodsCategory;
	String goodsContent;
	String goodsSize;
	String goodsColor;
	int goodsPrice;
	int goodsSale;
	int goodsInventory; // 재고
	int goodsCount; // 조회수
	String goodsImg1;
	String goodsImg2;
	String goodsImg3;
	String goodsDate;
}