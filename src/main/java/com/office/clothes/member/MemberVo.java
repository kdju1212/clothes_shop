package com.office.clothes.member;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVo {

	int user_no;
	String user_id;
	String pwd;
	String name;
	String email;
	String phone;
	String gender;
	int age;
	Date cre_date;
	Date mod_date;

}
