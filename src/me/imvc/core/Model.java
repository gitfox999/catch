package me.imvc.core;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.log4j.Logger;
import org.hibernate.search.FullTextSession;
import org.springframework.jdbc.core.JdbcTemplate;

public interface Model {

	Set<Long> getIds();

	void setIds(Set<Long> ids);

	String getNotUpdate();

	void setNotUpdate(String notUpdate);

	String getSearchField();

	void setSearchField(String searchField);

	EntityUtils getEntityUtils();

	void setEntityUtils(EntityUtils entityUtils);

	String getSearch();

	void setSearch(String search);

	Set<Object> getDataSet();

	void setDataSet(Set<Object> dataSet);

	Map<String, Object> getSearchParams();

	void setSearchParams(Map<String, Object> searchParams);

	int getNumPerPage();

	void setNumPerPage(int numPerPage);

	int getPageNum();

	void setPageNum(int pageNum);

	long getTotalCount();

	void setTotalCount(long totalCount);

	String getOrderDirection();

	void setOrderDirection(String orderDirection);

	String getOrderField();

	void setOrderField(String orderField);

	List<Object> getDataList();

	void setDataList(List<Object> dataList);

	HibernateTemplateSupport getHibernateTemplate();

	void setHibernateTemplate(HibernateTemplateSupport hibernateTemplate);

	HibernateTemplateSupport getHt();

	JdbcTemplate getJdbcTemplate();

	void setJdbcTemplate(JdbcTemplate jdbcTemplate);

	Logger getLoggerModel();

	void setLoggerModel(Logger loggerModel);

	@SuppressWarnings("rawtypes")
	List getPageData(String entityName);

	long getCount(String tableName, String where);

	@SuppressWarnings("rawtypes")
	List findByHqlWhere(String entityName, String where);

	Object get(Class<?> entityClass, Serializable id);

	Serializable save(Object entity);

	void delete(Object entity);

	@SuppressWarnings("rawtypes")
	void deleteAll(Collection entities);

	void update(Object entity);

	void saveOrUpdate(Object entity);

	FullTextSession getFullTextSession();

	void createIndexer();

	@SuppressWarnings("rawtypes")
	List fullTextQuery(org.apache.lucene.search.Query query,
			Class<?>... entityClass);

	org.apache.lucene.search.Query luceneQuery(String query, String... fields);

	org.apache.lucene.search.Query hdslQuery(Class<?> entityClass,
			String query, String... fields);

	@SuppressWarnings("rawtypes")
	List hdslSearch(Class<?> entityClass, String content, String... fields);

	@SuppressWarnings("rawtypes")
	List hdslSearch(Class<?> entityClass, String content);

	@SuppressWarnings("rawtypes")
	List luceneSearch(Class<?> entityClass, String query, String field);

}
