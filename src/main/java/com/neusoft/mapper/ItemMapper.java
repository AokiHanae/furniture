package com.neusoft.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年12月02日 12时57分57秒
 */
import com.neusoft.base.BaseDao;
import com.neusoft.po.Item;


public interface ItemMapper extends BaseDao<Item>{

	List<Item> listtj(@Param("list") List<Integer> types);
	
	List<Item> recommendListByIdList(List<String> idList);
	
}
