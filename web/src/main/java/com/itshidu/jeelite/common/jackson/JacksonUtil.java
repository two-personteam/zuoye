package com.itshidu.jeelite.common.jackson;

import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fasterxml.jackson.databind.ser.FilterProvider;
import com.fasterxml.jackson.databind.ser.impl.SimpleBeanPropertyFilter;
import com.fasterxml.jackson.databind.ser.impl.SimpleFilterProvider;

public class JacksonUtil {

	public static ObjectWriter GetObjectWriter(Include inc,Class[] cs,String... excludes) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		mapper.setSerializationInclusion(inc);
		SimpleBeanPropertyFilter theFilter = SimpleBeanPropertyFilter.serializeAllExcept(excludes);  
        FilterProvider filters = new SimpleFilterProvider().addFilter("ExcludesFilter", theFilter);  
		for(int i=0;cs!=null&&i<cs.length;i++) {
			mapper.addMixIn(cs[i], ExcludesFilteMixIn.class);
		}
        return mapper.writer(filters);
	}
	public static ObjectWriter GetObjectWriter(Include inc,Class c,String... excludes) throws JsonProcessingException {
		return GetObjectWriter(inc, new Class[] {c}, excludes);
	}
	public static ObjectWriter GetObjectWriter(Class c,String... excludes) throws JsonProcessingException {
		return GetObjectWriter(Include.ALWAYS, new Class[] {c}, excludes);
	}
	public static ObjectWriter GetObjectWriter(Class[] cs,String... excludes) throws JsonProcessingException {
		return GetObjectWriter(Include.ALWAYS, cs, excludes);
	}
	
	/**
	 * 将对象序列化成JSON字符串
	 * @param obj
	 * @param inc Include.NON_NULL/NON_EMPTY/ALWAYS/....
	 * @param c 哪些class中的属性需要排除，只能是Bean中的属性，注意：Map中的key无法排除
	 * @param excluds 排除对象中的哪些属性
	 * @return
	 * @throws JsonProcessingException
	 */
	public static String write(Object obj,Include inc,Class c,String... excludes) throws JsonProcessingException {
        return GetObjectWriter(inc, c, excludes).writeValueAsString(obj);
	}
	public static String write(Object obj,Include inc,Class[] cs,String... excludes) throws JsonProcessingException {
		return GetObjectWriter(inc, cs, excludes).writeValueAsString(obj);
	}
	public static String write(Object obj,Class c,String... excluds) throws JsonProcessingException {
		return write(obj, Include.ALWAYS,c, excluds);
	}
	public static String write(Object obj,Class[] cs,String... excluds) throws JsonProcessingException {
		return write(obj, Include.ALWAYS,cs, excluds);
	}
	
	public static String write(Object obj) throws JsonProcessingException {
		return write(obj,new Class[] {});
	}
	
	public static void main(String[] args) throws JsonProcessingException {
		//创建一个Writer对象，只包含不为空的值，排除age属性，针对的类是DemoBean
		ObjectWriter writer = JacksonUtil.GetObjectWriter(Include.NON_EMPTY,DemoBean.class,"age");

		DemoBean bean = new DemoBean();
		bean.setName("悟空");
		bean.setAddr("花果山·水帘洞");
		bean.setAge(18);
		bean.setSex(2);
		
		String str=writer.writeValueAsString(bean);
		System.out.println(str);
		// {"name":"悟空","sex":2,"addr":"花果山·水帘洞"}
	}
}
