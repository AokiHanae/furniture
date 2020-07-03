package com.neusoft.utils;


import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.impl.CommonsHttpSolrServer;

import java.net.MalformedURLException;

public class SolrContext {
	private final static String URL = "http://localhost:8088/solr";
	private static CommonsHttpSolrServer server = null;
	static{
		try {
			server = new CommonsHttpSolrServer(URL);
		} catch (MalformedURLException e) {
			e.printStackTrace();
		}
	}


	public static SolrServer getServer() {
		return server;
	}
	
}
