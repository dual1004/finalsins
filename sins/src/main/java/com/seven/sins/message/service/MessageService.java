package com.seven.sins.message.service;

import java.util.List;

import com.seven.sins.message.vo.MessageVO;
import com.sun.javafx.collections.MappingChange.Map;

public interface MessageService {

	List<MessageVO> messageReadlist(String userid);

}
