package com.seven.sins.fire.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.seven.sins.fire.dao.FireDAO;
import com.seven.sins.fire.vo.FireVO;

@Service("fireService")
public class FireServiceImpl implements FireService{
	@Autowired
	private FireDAO fireDAO;

	@Override
	public int doChannelContentFire(FireVO fire) {
		return fireDAO.doChannelContentFire(fire);
	}

	@Override
	public int cancelChannelContentFire(FireVO fire) {
		return fireDAO.cancelChannelContentFire(fire);
	}

	@Override
	public ArrayList<FireVO> getFireList(FireVO search) {
		return fireDAO.getFireList(search);
	}

	@Override
	public int fireComment(FireVO vo) {
		return fireDAO.fireComment(vo);
	}

	@Override
	public int fireCommentCancel(FireVO vo) {
		return fireDAO.fireCommentCancel(vo);
	}

	/*@Override
	public String getUserId(FireVO fire) {
		return fireDAO.getUserId(fire);
	}*/

}
