package me.imvc.core;

import java.io.IOException;
import java.io.Serializable;
import java.util.Collection;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.apache.log4j.Logger;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.springframework.jdbc.core.JdbcTemplate;
import org.wltea.analyzer.lucene.IKQueryParser;

public abstract class BaseModel{

	private HibernateTemplateSupport hibernateTemplate;
	private JdbcTemplate jdbcTemplate;
	private Logger loggerModel;
	private EntityUtils entityUtils;
	private Set<Long> ids;
	private Map<String, Object> searchParams;
	private String search;
	private String searchField;
	private List<Object> dataList;
	private Set<Object> dataSet;
	private String notUpdate;
	// 分页变量
	private int numPerPage = 20;// 默认每页显示20条
	private int pageNum = 1;// 开始第一页
	private long totalCount;
	private String orderDirection;
	private String orderField;
	private double[] sum;
	private String[] sumField;

	// 分页变量

	public Set<Long> getIds() {
		Set<Long> id=null;
		if(null!=ids){
		id=new HashSet<Long>();
		for (Object e : ids) {
			id.add(Long.valueOf(e.toString()));
		}
		}
		return id;
	}
	
	public double[] getSum() {
		return sum;
	}

	public void setSum(double[] sum) {
		this.sum = sum;
	}
	
	public String[] getSumField() {
		return sumField;
	}

	public void setSumField(String[] sumField) {
		this.sumField = sumField;
	}

	public String getNotUpdate() {
		return notUpdate;
	}

	public void setNotUpdate(String notUpdate) {
		this.notUpdate = notUpdate;
	}

	public String getSearchField() {
		return searchField;
	}

	public void setSearchField(String searchField) {
		this.searchField = searchField;
	}

	public EntityUtils getEntityUtils() {
		return entityUtils;
	}

	public void setEntityUtils(EntityUtils entityUtils) {
		this.entityUtils = entityUtils;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public Set<Object> getDataSet() {
		return dataSet;
	}

	public void setDataSet(Set<Object> dataSet) {
		this.dataSet = dataSet;
	}

	public Map<String, Object> getSearchParams() {
		
//		if(null!=searchParams){	
//			System.out.println(searchParams.size());
//		}

		return searchParams;
	}

	public void setSearchParams(Map<String, Object> searchParams) {
		this.searchParams = searchParams;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(long totalCount) {
		this.totalCount = totalCount;
	}

	public String getOrderDirection() {
		return orderDirection;
	}

	public void setOrderDirection(String orderDirection) {
		this.orderDirection = orderDirection;
	}

	public String getOrderField() {
		return orderField;
	}

	public void setOrderField(String orderField) {
		this.orderField = orderField;
	}

	public void setIds(Set<Long> ids) {
		this.ids = ids;
	}

	public List<Object> getDataList() {
		return dataList;
	}

	public void setDataList(List<Object> dataList) {
		this.dataList = dataList;
	}

	public HibernateTemplateSupport getHibernateTemplate() {
		return hibernateTemplate;
	}

	public HibernateTemplateSupport getHt() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplateSupport hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public Logger getLoggerModel() {
		return loggerModel;
	}

	public void setLoggerModel(Logger loggerModel) {
		this.loggerModel = loggerModel;
	}

	// ===============================Hibernate
	// begin====================================
	// 默认页面数据支持 简单搜索、分页、排序
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List getPageData(String entityName) {
		if (getSearchParams() == null) {
			setTotalCount(this.getCount(entityName, "1=1", " where "));
			String orderSql = " order by id desc";
			if (getOrderField() != null && getOrderDirection() != null
					&& !getOrderField().isEmpty()
					&& !getOrderDirection().isEmpty()) {
				orderSql = " order by " + getOrderField() + " "
						+ getOrderDirection();
			}
			setDataList(this.findByHqlWhere(entityName, "1=1 "+orderSql, " where "));
			setSum(this.getSum(entityName,"1=1", " where "));
		} else {// key to hql
			String from = null;			
			String where2= null;
			if(null!=getSearchParams().get("from")){
				String [] value_a=null;
				value_a= (String[]) getSearchParams().get("from");
				from=value_a[0];
				getSearchParams().remove("from");
			}
			if(null!=getSearchParams().get("where")){
				String [] value_a=null;
				value_a= (String[]) getSearchParams().get("where");
				where2=value_a[0];
				getSearchParams().remove("where");
			}
			String where = "";
			String first = "1=1";			
			for (String key : getSearchParams().keySet()) {
				String[] value_a=(String[])getSearchParams().get(key);
				if (!value_a[0].isEmpty()) {
					String field = key.replace("and_", " and ")
							.replace("ro_", " or ").replace("not_", " not ")
							.replace("_zkh_", "(").replace("_ykh", ")")
							.replace("_dot_", ".").replace("_like", " like \'%")
							.replace("_eq", "=").replace("_ne", "!=")
							.replace("_lt", "<").replace("_gt", ">")
							.replace("_le", "<=").replace("_ge", ">=").replace("_date", "FUNCTION(\'date_format\',\'")
							.replace("_string", "\'").replace("_number", " ");
					
					if (field.charAt(field.length() - 1) == '\'') {
						if(field.charAt(field.length() - 2) == ','){
							field += value_a[0] + "\', \'%Y-%m-%d %H:%i:%s\')";
						}else{
							field += value_a[0] + "\'";
						}
					}else if(field.charAt(field.length() - 1) == '%') {
						field += value_a[0] + "%\'";
					} else {
						field += value_a[0];
					}
					/*if (field.charAt(field.length() - 1) == '\'') {
						if(field.charAt(field.length() - 2) == '('){
							field += value_a[0] + "\',\'yyyy-MM-dd HH24:MI:SS')";
						}else{
							field += value_a[0] + "\'";
						}
					}
					if (field.charAt(field.length() - 1) == '%') {
						field += value_a[0] + "%\'";
					}
					if(key.indexOf("_is")>0){
						if("notnull".equals(value_a[0])){
							field += "not null";
						}if("null".equals(value_a[0])){
							field += " null";
						}
					} 
					if (field.charAt(field.length() - 1) == ' ') {
						field += value_a[0];
					}*/
					if (field.charAt(0) != ' ') {
						first = field;
					} else {
						where += field;
					}
				}
			}
			where = first + where;
			
			if(where2 != null){
				where += " where " + where2;
			}
			
			
			if (getOrderField() != null && getOrderDirection() != null
					&& !getOrderField().isEmpty()
					&& !getOrderDirection().isEmpty()) {
				where += " order by " + getOrderField() + " "
						+ getOrderDirection();
			} else {
				where += " order by id desc";
			}
			if (from == null) {
				setTotalCount(this.getCount(entityName, where, " where "));
				setDataList(this.findByHqlWhere(entityName, where, " where "));
				setSum(this.getSum(entityName, where, " where "));
			} else {
				setTotalCount(this.getCount(from, where, " and "));
				setDataList(this.findByHqlWhere(from, where, " and "));
				setSum(this.getSum(from, where, " and "));
			}

		}
		return getDataList();
	}

	public long getCount(String tableName, String where ,String isAnd) {
		String sql = "select count(*) from " + tableName + " "+isAnd+" " + where;
		return ((Long) this
				.getHibernateTemplate()
				.getSession()
				.createQuery(
						sql)
				.iterate().next()).longValue();
	}
	
	public double[] getSum(String tableName, String where ,String isAnd) {
		if(sumField != null && sumField.length > 0){
			String fields = "";
			for(int i =0;i<sumField.length;i++){
				fields += "sum("+sumField[i]+")";
				if(i!= sumField.length-1){
					fields += ",";
				}
			}
			String sql = "select "+fields+" from " + tableName + " "+isAnd+" " + where;
			Object obj = this.getHibernateTemplate().getSession().createQuery(sql).iterate().next();
			double[] dd = new double[sumField.length];
			if(obj == null){
				for(int i =0;i<sumField.length;i++){
					dd[i] = 0;
				}
			}else{
				if(sumField.length == 1){
					dd[0] = (Long)obj;
				}else{
					Object[] objTmp = (Object[])obj;
					for(int i =0;i<sumField.length;i++){
						dd[i] = (Long)objTmp[i];
					}
				}
			}
			return dd;
		}else{
			return null;
		}
	}

	@SuppressWarnings("rawtypes")
	public List findByHqlWhere(String entityName, String where,String isAnd) {
		String sql = "from " + entityName + " "+isAnd+" " + where;
		System.out.println(sql);
		return this.getHibernateTemplate().getSession()
				.createQuery(sql)
				.setFirstResult((this.getPageNum() - 1) * this.getNumPerPage())
				.setMaxResults(this.getNumPerPage()).list();
	}

	public List findByHqlWhere2(String entityName, String where,String isAnd) {
		String sql = entityName + " "+isAnd+" " + where;
		System.out.println(sql);
		return this.getHibernateTemplate().getSession()
				.createQuery(sql)
				.setFirstResult((this.getPageNum() - 1) * this.getNumPerPage())
				.setMaxResults(this.getNumPerPage()).list();
	}
	
	public Object get(Class<?> entityClass, Serializable id) {
		return this.getHibernateTemplate().get(entityClass, id);
	}

	public Serializable save(Object entity) {
		return this.getHibernateTemplate().save(entity);
	}

	public void delete(Object entity) {
		this.getHibernateTemplate().delete(entity);
	}

	@SuppressWarnings("rawtypes")
	public void deleteAll(Collection entities) {
		this.getHibernateTemplate().deleteAll(entities);
	}

	public void update(Object entity) {
		this.getHibernateTemplate().update(entity);
	}

	public void saveOrUpdate(Object entity) {
		this.getHibernateTemplate().saveOrUpdate(entity);
	}

	// ==============================hibernate
	// end==================================

	// ==============================hibernate search begin====================
	public FullTextSession getFullTextSession() {
		return Search.getFullTextSession(this.getHibernateTemplate()
				.getSession());
	}

	public void createIndexer() {
		try {// 首次建立索引
			this.getFullTextSession().createIndexer().startAndWait();
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List fullTextQuery(org.apache.lucene.search.Query query,
			Class<?>... entityClass) {
		org.hibernate.search.FullTextQuery fullTextQuery = this
				.getFullTextSession().createFullTextQuery(query, entityClass);
		fullTextQuery.setFirstResult((this.getPageNum() - 1)
				* this.getNumPerPage());
		fullTextQuery.setMaxResults(this.getNumPerPage());
		setDataList(fullTextQuery.list());
		setTotalCount(fullTextQuery.getResultSize());
		return getDataList();
	}

	public org.apache.lucene.search.Query luceneQuery(String query,
			String... fields) {
		org.apache.lucene.search.Query luceneQuery = null;
		try {
			luceneQuery = IKQueryParser.parseMultiField(fields, query);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return luceneQuery;
	}

	public org.apache.lucene.search.Query hdslQuery(Class<?> entityClass,
			String query, String... fields) {
		org.hibernate.search.query.dsl.QueryBuilder queryBuilder = this
				.getFullTextSession().getSearchFactory().buildQueryBuilder()
				.forEntity(entityClass).get();
		org.apache.lucene.search.Query hdslQuery = queryBuilder.keyword()
				.onFields(fields).matching(query).createQuery();
		return hdslQuery;
	}

	// objectClass需要搜索内容的类 content需要搜索的内容 field需要搜索的字段
	// Hibernate Search query DSL
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List hdslSearch(Class<?> entityClass, String content,
			String... fields) {
		org.hibernate.search.query.dsl.QueryBuilder queryBuilder = this
				.getFullTextSession().getSearchFactory().buildQueryBuilder()
				.forEntity(entityClass).get();
		org.apache.lucene.search.Query query = queryBuilder.keyword()
				.onFields(fields).matching(content).createQuery();
		org.hibernate.search.FullTextQuery fullTextQuery = this
				.getFullTextSession().createFullTextQuery(query, entityClass);
		fullTextQuery.setFirstResult((this.getPageNum() - 1)
				* this.getNumPerPage());
		fullTextQuery.setMaxResults(this.getNumPerPage());
		setDataList(fullTextQuery.list());
		setTotalCount(fullTextQuery.getResultSize());
		return getDataList();
	}

	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List hdslSearch(Class<?> entityClass, String content) {
		org.hibernate.search.query.dsl.QueryBuilder queryBuilder = this
				.getFullTextSession().getSearchFactory().buildQueryBuilder()
				.forEntity(entityClass).get();
		org.apache.lucene.search.Query query = queryBuilder.keyword()
				.onFields(getSearchField().split(",")).matching(content)
				.createQuery();
		org.hibernate.search.FullTextQuery fullTextQuery = this
				.getFullTextSession().createFullTextQuery(query, entityClass);
		fullTextQuery.setFirstResult((this.getPageNum() - 1)
				* this.getNumPerPage());
		fullTextQuery.setMaxResults(this.getNumPerPage());
		setDataList(fullTextQuery.list());
		setTotalCount(fullTextQuery.getResultSize());
		return getDataList();

	}

	// Lucene query via the QueryParser
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List luceneSearch(Class<?> entityClass, String query, String field) {
		org.apache.lucene.search.Query luceneQuery = null;
		try {
			luceneQuery = IKQueryParser.parse(field, query);
		} catch (IOException e) {
			e.printStackTrace();
		}
		org.hibernate.search.FullTextQuery fullTextQuery = getFullTextSession()
				.createFullTextQuery(luceneQuery, entityClass);
		fullTextQuery.setFirstResult((this.getPageNum() - 1)
				* this.getNumPerPage());
		fullTextQuery.setMaxResults(this.getNumPerPage());
		setDataList(fullTextQuery.list());
		setTotalCount(fullTextQuery.getResultSize());
		return getDataList();
	}
	// ==============================hibernate search end====================

}
