package com.itshidu.holyweb.persistence;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


/**
 * 
 * 基础实现类 + 分页功能
 * 
 * @author 夏增明
 * @version 1.0 create date 2013-10-5
 * @version 2.0 create date 2016-03-16 
 * @version 3.0 create date 2017-04-05
 * @version 4.0 create 2017年4月20日22:08:56
 */
@Repository //创建一个bean放入Spring容器
@SuppressWarnings("unchecked")
public class BaseDAOImpl implements BaseDAO {
	
	@Autowired //Spring根据类型自动注入，无需get、set，可以private
	private SessionFactory factory;
	
	
	
	public void save(Object... objs) throws Exception {
		for(Object obj:objs)
		factory.getCurrentSession().save(obj);
	}
	
	public void delete(Object... objs) throws Exception {
		for(Object obj:objs)
		factory.getCurrentSession().delete(obj);
	}
	
	public void update(Object... objs) throws Exception {
		for(Object obj:objs)
		factory.getCurrentSession().update(obj);
	}


	public <T> Paging<T> find(String hql, int page, int rows,Object... params) throws Exception {
		return HibernateHelper.find(factory.getCurrentSession(),hql, page, rows, params);
	}
	
	
	public <T> Paging<T> findByProperty(Class<T> c,String property,Object value, int page, int rows)throws Exception {
		Session session = factory.getCurrentSession();
		return HibernateHelper.findByProperty(c, property, value, page, rows, session);
	}

	public <T> T findOneByProperty(Class<T> c, String property, Object value)throws Exception {
		Session session = factory.getCurrentSession();
		return HibernateHelper.findOneByProperty(c, property, value, session);
	}

	@Override
	public <T> T findOne(String hql, Object... params) throws Exception {
		return HibernateHelper.findOne(factory.getCurrentSession(), hql, params);
	}

	
	
	public <T> Query<T> createNamedQuery(String name){
		return factory.getCurrentSession().createNamedQuery(name);
	}

	@Override
	public <T> List<T> list(String hql, int page, int rows, Object... params) throws Exception {
		Query<T> query = factory.getCurrentSession().createQuery(hql);
		for(int i=0;(params!=null&&i<params.length);i++){
			query.setParameter(i, params[i]);
		}
		int firstResult = (page - 1) * rows;	//开始位置
		query.setFirstResult(firstResult);
		query.setMaxResults(rows);
		return query.getResultList();
	}
	
	@Override
	public <T> List<T> list(Class<T> c) throws Exception {
		return list("from "+c.getName(), 1, Integer.MAX_VALUE);
	}

	@Override
	public <T> List<T> list(Class<T> c, int page, int rows) throws Exception {
		return list("from "+c.getName(), page,rows);
	}


	@Override
	public <T> T get(Class<T> c, Serializable id) throws Exception {
		return factory.getCurrentSession().get(c, id);
	}

	@Override
	public <T> T load(Class<T> c, Serializable id) throws Exception {
		return factory.getCurrentSession().load(c, id);
	}

	@Override
	public void delete(Class<?> c, Serializable... ids) throws Exception {
		Session session = factory.getCurrentSession();
		for(Serializable id:ids) {
			session.delete(session.get(c, id));
		}
	}
	
}
