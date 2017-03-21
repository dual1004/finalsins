package com.seven.sins.search.service;

import java.util.ArrayList;

import com.seven.sins.search.vo.SearchChannelVO;
import com.seven.sins.search.vo.SearchMemberVO;

public interface SearchService {

	ArrayList<SearchMemberVO> getMember(String userId, String word);

	ArrayList<SearchChannelVO> getChannel(String userId, String word);

}
