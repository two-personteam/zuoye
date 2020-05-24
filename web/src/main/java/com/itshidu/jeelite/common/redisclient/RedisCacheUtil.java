package com.itshidu.jeelite.common.redisclient;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;

public class RedisCacheUtil {
	public static RedisTemplate redisTemplate;
	@Autowired void setRedisTemplate(RedisTemplate redisTemplate){
		RedisCacheUtil.redisTemplate = redisTemplate;
	}
	//@Qualifier("jedisTemplate")
	

	public static <T> ListOperations<String, T> setList(String key, List<T> dataList) {
		ListOperations<String, T> listOperation = redisTemplate.opsForList();
		if (null != dataList) {
			int size = dataList.size();
			for (int i = 0; i < size; i++) {
				listOperation.rightPush(key, dataList.get(i));
			}
		}
		return listOperation;
	}
	/**
	 * 获取list缓存的内容
	 * @param key 键
	 * @param start 开始
	 * @param end 结束  0 到 -1代表所有值
	 * @return
	 */
	public static <T> List<T> getList(String key,long start, long end){
		return redisTemplate.opsForList().range(key, start, end);
	}
	/**
	 * 获得缓存的list对象
	 * @param key 缓存的键值
	 * @return 缓存键值对应的数据
	 */
	public static <T> List<T> getList(String key) {
		List<T> dataList = new ArrayList<T>();
		ListOperations<String, T> listOperation = redisTemplate.opsForList();
		Long size = listOperation.size(key);
		for (int i = 0; i < size; i++) {
			dataList.add((T) listOperation.leftPop(key));
		}
		return dataList;
	}
	public static <T> T getListIndex(String key,long index){
		return (T) redisTemplate.opsForList().index(key, index);
	}
	/**
	 * 获取list缓存的长度
	 * @param key 键
	 * @return
	 */
	public static long getListSize(String key){
		return redisTemplate.opsForList().size(key);
	}
	
}
