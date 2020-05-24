package com.itshidu.jeelite.common.util;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.TimeUnit;

import javax.script.ScriptEngine;
import javax.script.ScriptEngineManager;
import javax.script.ScriptException;
import jdk.nashorn.api.scripting.ScriptObjectMirror;

public class ScriptEngineUtil {
	public static ScriptEngineManager manager = new ScriptEngineManager();
	public static ScriptEngine engine = manager.getEngineByName("nashorn");
	public static void test() throws ScriptException, IOException {
		InputStream in = ScriptEngineUtil.class.getClassLoader().getResourceAsStream("scripts/demo.js");
		engine.eval(new InputStreamReader(in));
		in.close();
	}
	public static void main(String[] args) throws ScriptException, IOException, InterruptedException {
		test();
		
	
		
		System.in.read();
	}
	public static void fun4(ScriptObjectMirror obj) {
		System.out.println(obj.getClass());
		ScheduledExecutorService service = Executors.newSingleThreadScheduledExecutor();
		service.scheduleWithFixedDelay(()->{
			try {
				InputStream in = ScriptEngineUtil.class.getClassLoader().getResourceAsStream("scripts/demo.js");
				engine.eval(new InputStreamReader(in));
				in.close();
			} catch (Exception e) {
				// TODO: handle exception
			}
		}, 1,1,TimeUnit.SECONDS);
	}
}
