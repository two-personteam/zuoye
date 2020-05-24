package com.itshidu.jeelite.common.util;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;



/**
 * 获取父类中的所有属性和方法 工具类
 * @author Master.Xia
 */
public class ReflectionUtils {
	
	/**
	 * 从类或祖先类中获取Method
	 * @param cc
	 * @param methodName
	 * @param parameterTypes
	 * @return
	 */
    public static Method getDeclaredMethod(Class cc, String methodName, Class<?> ... parameterTypes){  
	        Method method = null ;  	          
	        for(Class<?> clazz = cc; clazz != Object.class; clazz = clazz.getSuperclass()) {  
	            try {  
	                method = clazz.getDeclaredMethod(methodName, parameterTypes) ;  
	                return method ;  
	            } catch (Exception e) { }  
	        }  	          
	        return null;  
    }  
	      
	/** 
	 * 直接调用对象方法, 而忽略修饰符(private, protected, default) 
     * @param object : 子类对象 
     * @param methodName : 父类中的方法名 
     * @param parameterTypes : 父类中的方法参数类型 
     * @param parameters : 父类中的方法参数 
     * @return 父类中方法的执行结果 
     */        
    public static Object invokeMethod(Object object, String methodName, Class<?> [] parameterTypes,  
            Object [] parameters) {
        //根据 对象、方法名和对应的方法参数 通过反射 调用上面的方法获取 Method 对象
        Method method = getDeclaredMethod(object.getClass(), methodName, parameterTypes) ;
        method.setAccessible(true) ;
        try {
            if(null != method) {
                //调用object 的 method 所代表的方法，其方法的参数是 parameters
                return method.invoke(object, parameters) ;
            }
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
        return null;  
    }  
  
    /**
     * 从类或祖先类中获取Field
     * @param cc
     * @param fieldName
     * @return
     */
    public static Field getDeclaredField(Class cc, String fieldName){  
        Field field = null ;                      
        for(Class<?> clazz = cc; clazz != Object.class ; clazz = clazz.getSuperclass()) {  
            try {  
                field = cc.getDeclaredField(fieldName) ;  
                return field ;  
            } catch (Exception e) { }   
        }        
        return null;  
    } 
    
    /** 
     * 直接设置对象属性值, 忽略 private/protected 修饰符, 也不经过 setter 
     * @param object : 子类对象 
     * @param fieldName : 父类中的属性名 
     * @param value : 将要设置的值 
     */        
    public static void setFieldValue(Object object, String fieldName, Object value){        
        //根据 对象和属性名通过反射 调用上面的方法获取 Field对象  
        Field field = getDeclaredField(object.getClass(), fieldName) ;            
        //抑制Java对其的检查  
        field.setAccessible(true) ;            
        try {  
            //将 object 中 field 所代表的值 设置为 value  
             field.set(object, value) ;  
        } catch (IllegalArgumentException e) {  
        	e.printStackTrace();  
        } catch (IllegalAccessException e) {  
            e.printStackTrace();  
        }            
    }
    
    /** 
     * 直接读取对象的属性值, 忽略 private/protected 修饰符, 也不经过 getter 
     * @param object : 子类对象 
     * @param fieldName : 父类中的属性名 
     * @return : 父类中的属性值 
     */        
    public static Object getFieldValue(Object object, String fieldName){  
        //根据 对象和属性名通过反射 调用上面的方法获取 Field对象  
        Field field = getDeclaredField(object.getClass(), fieldName) ;            
        field.setAccessible(true) ;        
        try {  
            return field.get(object) ;                
        } catch(Exception e) {  
            e.printStackTrace() ;  
        }            
        return null;  
    }  
    
    /**
     * 调用set方法
     * @param object
     * @param field
     * @param value
     * @throws InvocationTargetException 
     * @throws IllegalAccessException 
     */
    public static void setter(Object obj,String fieldName,Object value) throws IllegalAccessException, InvocationTargetException{
    	Class[] con = {
    			Byte.class,byte.class,
    			Short.class,short.class,
    			Integer.class,int.class,
    			Long.class,long.class,
    			Float.class,float.class,
    			Double.class,double.class,
    			Boolean.class,boolean.class,
    			Character.class,char.class};
    	
    	String methodName = "set"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
    	Field field = getDeclaredField(obj.getClass(), fieldName);
    	getDeclaredMethod(obj.getClass(), methodName, new Class[]{field.getType()});
    }
    
    public static Object getter(Object obj,String fieldName){
    	String methodName = "get"+fieldName.substring(0,1).toUpperCase()+fieldName.substring(1);
    	return invokeMethod(obj, methodName, new Class[]{}, new Object[]{});
    }

    public static void main(String[] args) throws IllegalAccessException, InvocationTargetException {
    	
	}
}
