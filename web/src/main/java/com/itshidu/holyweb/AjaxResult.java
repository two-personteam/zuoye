package com.itshidu.holyweb;

import java.util.HashMap;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class AjaxResult extends HashMap {
	
	ObjectMapper mapper = new ObjectMapper();
    
    public static AjaxResult create(){
        return new AjaxResult();
    }
    public AjaxResult put(String key,Object value){
        super.put(key, value);
        return this;
    }
    public String toString() {
    	//return JSONObject.toJSONString(this);
    	try {
			return mapper.writeValueAsString(this);
		} catch (JsonProcessingException e) {
			return "Error";
		}
    }
    
    public static void main(String[] args) {
    	String a=AjaxResult.create()
    			.put("code", 1)
    			.put("user", "wukong")
    			.put("email", "wukong@qq.com").toString();
    	System.out.println(a);
    	
	}
}
