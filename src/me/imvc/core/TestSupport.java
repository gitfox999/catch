package me.imvc.core;

import javax.annotation.Resource;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "/me/imvc/config/springContext.xml",
		"/me/imvc/config/springBeans.xml" })
@Transactional
public class TestSupport {

	private HibernateTemplateSupport hibernateTemplate;

	public HibernateTemplateSupport getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplateSupport hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

}
