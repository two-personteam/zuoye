package com.itshidu.holyweb.persistence;

import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.query.Query;
import org.hibernate.Session;
/**
 * Hibernate查询辅助工具，使分页查询更方便
 * @author Master.Xia v1.0 Date:2017年1月14日17:39:17
 * @author Master.Xia v2.0 Date:2017年10月18日14:55:25
 * @author Master.Xia v3.0 Date:2018年2月28日17:16:49
 */
public class HibernateHelper {
	
	public static void main(String[] args) {
		String  str="SUN公司被Oracle收购，是否意味着java被逼上了死路？";
		str = "from User";
        String s = "\\d+.\\d+|\\w+";
        Pattern  pattern=Pattern.compile(s);  
        Matcher  ma=pattern.matcher(str);  
   
        while(ma.find()){  
            System.out.println(ma.group());  
        }  
        
        /*
        String hql = "";
        System.out.println("--- "+hql);
        Pattern  pattern=Pattern.compile("\\d+.\\d+|\\w+");  
        Matcher  ma=pattern.matcher(hql);
        
        String table = null;
        for(int i=1;ma.find();i++){
        	table = ma.group();
        	if(i==2){
        		break;
        	}
        }

*/
	}
	
	
	private static int count(Session session,final String hql,final Object... params) {
		String countStr = "select count(1) "+hql.substring(hql.toLowerCase().indexOf("from"));
		Query countQuery = session.createQuery(countStr);
		for(int i=0;(params!=null&&i<params.length);i++){
			countQuery.setParameter(i, params[i]);
		}
		return ((Long) countQuery.uniqueResult()).intValue();
	}
	@SuppressWarnings({"unchecked", "unused" })
	private static <T> Paging<T> query(Session session,final String hql, final int page,final int rows,final Object... params) {
		Query<T> query = session.createQuery(hql);
		for(int i=0;(params!=null&&i<params.length);i++){
			query.setParameter(i, params[i]);
		}
        int count = count(session, hql, params);
		int firstResult = (page - 1) * rows;	//开始位置
		query.setFirstResult(firstResult);
		query.setMaxResults(rows);
		List<T> data = query.getResultList();
		return new Paging<T>(data, page, count, rows);
	}

	public static <T> Paging<T> find(Session session,String hql,int page,int rows,Object... params) {
        return query(session, hql, page, rows, params);
	}
	
	public static <T> Paging<T> find(Session session,Class<T> c,int page, int rows,Object... params){
		return query(session,"from "+c.getName(), page, rows,params);
	}
	
	public static <T> Paging<T> findByProperty(
			Class<T> c,String property,Object value, 
			int page, int rows,Session session){
		String hql = "from "+c.getName()+" where "+property+"=?";
		return query(session,hql, page, rows, value);
	}
	
	public static <T> T findOne(Session session, String hql,Object... params){
		List<T> list = list(session, hql, 1, 1, params);
		return list.size()>0? list.get(0):null;
	}
	
	public static <T> T findOneByProperty(Class<T> c, String property, Object value,Session session){
		String hql = "from "+c.getName()+" where "+property+"=?";
		return findOne(session,hql,value);
	}
	
	public static <T> List<T> list(Session session,String hql,int page,int rows,Object... params){
		Query<T> query = session.createQuery(hql);
		for(int i=0;(params!=null&&i<params.length);i++){
			query.setParameter(i, params[i]);
		}
		int firstResult = (page - 1) * rows;
		query.setFirstResult(firstResult);
		query.setMaxResults(rows);
		return query.getResultList();
	}
	
}
