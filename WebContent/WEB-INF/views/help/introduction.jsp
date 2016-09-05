<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="pageContent">
<div class="pageFormContent" style="height: 456px; overflow: auto;" layouth="10">
	<br /><br />
	<div class="unit">

	<strong>iMvc</strong>是以DWZ、Struts2、Spring3、Hibernate3为核心，来快速开发JavaEE企业级应用的开源框架组合。<br/><br/>
iMvc框架组合：<br/><br/>

DWZ：富客户端框架<br/><br/>

Struts2:使用Struts2 REST<br/><br/>

Spring3：使用AOP、IOC、事物管理、hibernateTemplate、jdbcTemplate等等..<br/><br/>

Hibernate3：数据持久层<br/><br/>

Spring Security：安全框架<br/><br/>

hibernate Validator：Bean验证<br/><br/>

hibernate Search：全文检索（它是对著名的全文检索系统Lucene的一个集成方案）<br/><br/>

IKAnalyzer：中文分词（用于hibernate Search 中文分词组件）<br/><br/>

Junit4：单元测试<br/><br/>

Log4j：日志信息输出<br/><br/>

JExcelApi：Excel导出<br/><br/>

代码生成器：使用Eclipse建模框架（EMF）中的源代生成码的工具JET(JavaEmitterTemplates)。<br /><br />

作业调度框架：quartz
<br/><br/>

	</div>
	<div class="divider"></div>
	
		<br /><br />
	<div class="unit">
	
	<strong>iMvc架构：</strong><br/><br/>
	mvc：<br/><br/>
	视图：使用jsp、EL、自定义EL函数、jstl、自定义TagFile标签、自定义SimpleTag标签。（禁止使用Scriptlet和StandardTag）<br/><br/>
	控制器：使用Struts2 REST。控制器将视图中的数据注入到模型中，模型处理数据后控制器将数据返回到视图上。<br/><br/>
	模型：imvc的模型是Domain Model 、ORM 、 ActiveRecord的结合体，Spring将模型自动装配到控制器中。<br/><br/>

<pre>
包结构：

me.imvc.app.controllers------------控制器包（分模块例如main模块：me.imvc.app.controllers.main）

me.imvc.app.entities------------实体Bean包（hibernate tools根据数据库表自动生成）

me.imvc.app.models------------模型包（分模块例如system模块：me.imvc.app.models.system）

me.imvc.config------------配置文件包（spring、struts2、hibernate、log4j、IKAnalyzer等配置文件.注：模型需要在springBeans.xml中配置，才能自动注入到控制器中。）

me.imvc.core------------iMv核心包（这里面就是imvc了，一些基类和过滤器）

me.imvc.document------------文档包

me.imvc.generate------------代码生成器

me.imvc.generate.template------------JET模板类

me.imvc.lib------------工具类包

me.imvc.log------------日志包

me.imvc.test------------模型单元测试包

</pre>
<br />
templates------------控制器、模型、视图模板
<br />
<pre>

WebContent结构：

dwz-----------dwz富客户端框架

images------------图片文件夹

javascripts------------js文件夹（对dwz修改的文件也都放入此文件夹）

stylesheets------------（css样式）

attachments------------（附件文件夹：如果不指定上传目录按照年月分文件夹）

attachments/xheditor/------------（xheditor编辑器上传的附件文件夹）

WEB-INF/views/------------视图



</pre>
</div>
	</div>
</div>