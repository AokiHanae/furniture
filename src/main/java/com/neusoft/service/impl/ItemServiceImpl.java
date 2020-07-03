/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date - 2017年12月02日 12时57分57秒
 */
package com.neusoft.service.impl;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.neusoft.base.*;
import com.neusoft.po.*;
import com.neusoft.service.ItemService;
import com.neusoft.utils.Pager;
import com.neusoft.utils.SolrContext;
import com.neusoft.utils.SystemContext;

import java.util.*;

import com.neusoft.po.*;
import com.neusoft.mapper.*;
import com.neusoft.service.*;



@Service
public class ItemServiceImpl extends BaseServiceImpl<Item> implements ItemService{
	 
	
	@Autowired
	private ItemMapper itemMapper;
	@Override
	public BaseDao<Item> getBaseDao() {
		return itemMapper;
	}
	
	
	public Pager<Item> solrFind(Item item, String condition) {
		
		Pager<Item> pagers = null;
		try {
			Integer pageSize = SystemContext.getPageSize();
			Integer pageOffset = SystemContext.getPageOffset();
			if(pageOffset==null||pageOffset<0) pageOffset = 0;
			if(pageSize==null||pageSize<0) pageSize = 15;
			
			StringBuffer sb = new StringBuffer();
			if (!StringUtils.isEmpty(condition)){
				sb.append("item_name:");
				sb.append("*");
				sb.append(condition);
				sb.append("*");
			}
			if (item.getCategoryIdTwo() != null){
				sb.append(" AND ");
				sb.append("item_categoryIdTwo:");
				sb.append(""+item.getCategoryIdTwo());
			}
			
			SolrServer server = SolrContext.getServer();
			
			SolrQuery query = new SolrQuery(sb.toString());
			
			query.setHighlight(true).setHighlightSimplePre("<span class='highligter'>")
								.setHighlightSimplePost("</span>")
								.setStart(pageOffset).setRows(pageSize);
			query.setParam("hl.fl", "item_name");
			
			QueryResponse resp = server.query(query);
			
			SolrDocumentList sdl = resp.getResults();
			
			pagers = new Pager();
			
			pagers.setOffset(pageOffset);
			pagers.setTotal(sdl.getNumFound());
			
			List<Item> list = new ArrayList<Item>();
			pagers.setDatas(list);
			for(SolrDocument sd:sdl) {
				
				Item ite = new Item();
				
				String id = (String)sd.getFieldValue("id");
				ite.setId(Integer.valueOf(id));
				List<String> names = resp.getHighlighting().get(id).get("item_name");
				ite.setName(names.get(0));
				String price = (String)sd.getFieldValue("item_price");
				
				ite.setPrice(price);
				
				String url1 = (String)sd.getFieldValue("item_url1");
				
				ite.setUrl1(url1);
				
				if (sd.getFieldValue("item_zk") != null){
					int zk = (Integer)sd.getFieldValue("item_zk");
					
					ite.setZk(zk);
				}
				
				int item_categoryIdOne = (Integer)sd.getFieldValue("item_categoryIdOne");
				
				ite.setCategoryIdOne(item_categoryIdOne);
				
				int item_categoryIdTwo = (Integer)sd.getFieldValue("item_categoryIdTwo");
				
				ite.setCategoryIdTwo(item_categoryIdTwo);
				list.add(ite);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SolrServerException e) {
			e.printStackTrace();
		}
		
		return pagers;
	}


	public List<Item> listtj(List<Integer> types) {
		// TODO Auto-generated method stub
		return itemMapper.listtj(types);
	}


	@Override
	public List<Item> recommendListByIdList(List<String> idList) {
		// TODO Auto-generated method stub
		return itemMapper.recommendListByIdList(idList);
	}

}
