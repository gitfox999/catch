<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="pageContent">
<br /><br />
	<div class="unit">
	<p><strong>原理介绍</strong>　　早在2004年，Martin Fowler就提出了“哪些方面的控制被反转了？”这个问题。他总结出是依赖对象的获得被反转了。基于这个结论，他为控制反转创造了一个更好的名字：依赖注入。许多非凡的应用（比HelloWorld.java更加优美，更加复杂）都是由两个或是更多的类通过彼此的合作来实现业务逻辑，这使得每个对象都需要，与其合作的对象（也就是它所依赖的对象）的引用。如果这个获取过程要靠自身实现，那么如你所见，这将导致代码高度耦合并且难以测试。
<br /><br />IoC 亦称为 “依赖倒置原理”(&quot;Dependency Inversion Principle&quot;) (Martin 2002:127)。差不多所有框架都使用了“倒置注入(Fowler 2004)技巧，这可说是IoC原理的一项应用。SmallTalk，C++, Java 或各种.NET 语言等面向对象程序语言的程序员已使用了这些原理。控制反转是Spring Framework的核心。
<br /><br />其原理是基于OO设计原则的The Hollywood Principle：Don&#39;t call us, we&#39;ll call you（别找我，我会来找你的）。也就是说，所有的组件都是被动的（Passive），所有的组件初始化和调用都由容器负责。组件处在一个容器当中，由容器负责管理。
<br /><br />简单的来讲，就是由容器控制程序之间的关系，而非传统实现中，由程序代码直接操控。这也就是所谓“控制反转”的概念所在：控制权由应用代码中转到了外部容器，控制权的转移，是所谓反转。
<p>
	</div>
	<div class="divider"></div>
</div>