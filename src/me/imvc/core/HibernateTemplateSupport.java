package me.imvc.core;

import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;

public class HibernateTemplateSupport extends HibernateTemplate{

	@Override
	public Session getSession() {
		return super.getSession();
	}	

}
