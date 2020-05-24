package com.itshidu.jeelite.common.others.jsonlib;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

public class JsonDateValueProcessor implements JsonValueProcessor {
	private String partten = "yyyy-MM-dd HH:mm:ss";
	
	public Object processArrayValue(Object value, JsonConfig arg1) {
		return process(value);
	}

	
	public Object processObjectValue(String arg0, Object value, JsonConfig arg2) {
		return process(value);
	}

	private Object process(Object value){
		if(value instanceof Date){    
            SimpleDateFormat sdf = new SimpleDateFormat(partten,Locale.CHINA);    
            return sdf.format(value);  
        }    
        return value == null ? "" : value.toString(); 
	}
}
