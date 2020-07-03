/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年12月02日 12时57分58秒
 */
package com.neusoft.service.impl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.neusoft.base.*;
import com.neusoft.po.*;
import com.neusoft.service.UserService;
import java.util.*;

import com.neusoft.po.*;
import com.neusoft.mapper.*;
import com.neusoft.service.*;

@Service
public class UserPostServiceImpl extends BaseServiceImpl<UserPost> implements UserPostService{
	 
	
	@Autowired
	private UserPostMapper userPostMapper;
	@Override
	public BaseDao<UserPost> getBaseDao() {
		return userPostMapper;
	}

}
