package com.office.clothes;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeService {

	@Autowired
	HomeDao homeDao;

	public List<HomeVo> home() {

		return homeDao.home();
	}

}
