package com.neusoft.utils;
import java.io.IOException;
import java.util.List;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializeConfig;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.alibaba.fastjson.serializer.SimpleDateFormatSerializer;

@SuppressWarnings("unused")
public class JsonUtil {

	private static final String[] DATE_FORMAT = { "yyyy-MM-dd HH:mm:ss" };

	private static SerializeConfig config = new SerializeConfig();
	static {
		String dateFormat = "yyyy-MM-dd HH:mm:ss";
		config.put(java.util.Date.class, new SimpleDateFormatSerializer(dateFormat));
	}

	public static String toJson(Object obj) {
		String json = null;

		try {
			if (obj != null) {
				json = JSON.toJSONString(obj, SerializerFeature.WriteDateUseDateFormat);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return json;
	}

	public static <T> T toBean(String json, Class<T> clazz) {
		T bean = null;

		try {
			if (json != null) {
				bean = JSON.parseObject(json, clazz);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bean;
	}

	public static <T> List<T> toBeanList(String json, Class<T> clazz) {
		List<T> beanList = null;

		try {
			if (json != null) {
				beanList = JSON.parseArray(json, clazz);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return beanList;
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public static void main(String[] args) throws IOException {


		
		
	}
}