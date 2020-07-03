package com.neusoft.utils;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.CommonsHttpSolrServer;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.junit.Before;
import org.junit.Test;

public class SolrTest {
	private final static String URL = "http://localhost:8088/solr";
	private CommonsHttpSolrServer server = null;
	
	@Before
	public void init() {
		try {
			server = new CommonsHttpSolrServer(URL);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
	}

	@Test
	public void test01() {
		try {
			SolrInputDocument doc = new SolrInputDocument();
			//id��Ψһ���������������ӵ�ʱ�������ӵ���ͬid����Ḳ��ǰ�����
			doc.addField("id","1");
			doc.addField("msg_title", "�����ҵĵ�һ��solrj�ĳ���");
			doc.addField("msg_content","�ҵ�solrj�ĳ��򾿾��ܲ����ܵ������أ�");
			server.add(doc);
			server.commit();
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (SolrServerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}


	@Test
	public void test02() {
		try {
			List<SolrInputDocument> docs = new ArrayList<SolrInputDocument>();
			SolrInputDocument doc = new SolrInputDocument();
			doc.addField("id", "2");
			doc.addField("msg_title", "�ܺã�solr���Թ�����");
			doc.addField("msg_content","slor���������ʽ������");
			docs.add(doc);
			doc = new SolrInputDocument();
			doc.addField("id", "3");
			doc.addField("msg_title", "����һ��solr�����");
			doc.addField("msg_content","�����ܲ������һ���б���Ϣ");
			docs.add(doc);
			server.add(docs);
			server.commit();
		} catch (SolrServerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test03() {
		try {
			List<Message> msgs = new ArrayList<Message>();
			msgs.add(new Message("4","����java bean�����",
					 new String[]{"ͨ��java bean������","java bean����Ӹ���"}));
			msgs.add(new Message("5","����java bean���б����ݵ����",
					 new String[]{"�������ͨ��һ������������","ͨ�����������ӵĸ���"}));
			server.addBeans(msgs);
			server.commit();
		} catch (SolrServerException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test04() {
		try {
			//�����ѯ�ַ���
			SolrQuery query = new SolrQuery("*:*");
			query.setStart(0);
			query.setRows(3);
			QueryResponse resp = server.query(query);
			//��ѯ�����Ľ����������SolrDocumentList��
			SolrDocumentList sdl = resp.getResults();
			System.out.println(sdl.getNumFound());
			for(SolrDocument sd:sdl) {
//				System.out.println(sd);
				System.out.println(sd.getFieldValue("msg_title")+","+sd.getFieldValue("msg_content"));
			}
		} catch (SolrServerException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test05() {
		try {
			SolrQuery query = new SolrQuery("*");
			query.setStart(0);
			query.setRows(3);
			QueryResponse resp = server.query(query);
			List<Message> list = resp.getBeans(Message.class);
			System.out.println(list.size());
			for(Message msg:list) {
				System.out.println(msg.getTitle());
			}
		} catch (SolrServerException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void test06() {
		try {
			SolrQuery query = new SolrQuery("*");
			query.setHighlight(true).setHighlightSimplePre("<span class='highligter'>")
								.setHighlightSimplePost("</span>")
								.setStart(0).setRows(5);
			query.setParam("hl.fl", "msg_title,msg_content");
			QueryResponse resp = server.query(query);
			//��ѯ�����Ľ����������SolrDocumentList��
			SolrDocumentList sdl = resp.getResults();
			System.out.println(sdl.getNumFound());
			for(SolrDocument sd:sdl) {
				String id = (String)sd.getFieldValue("id");
				System.out.println(resp.getHighlighting().get(id).get("msg_content"));
			}
		} catch (SolrServerException e) {
			e.printStackTrace();
		}
	}
}
