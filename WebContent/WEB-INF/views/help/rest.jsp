<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="pageContent">
<br/><br/>
	<div class="unit">
	<p><strong>REST</strong>，即REST(Representational State Transfer表述性状态转移)是一种针对网络应用的设计和开发方式，可以降低开发的复杂性，提高系统的可伸缩性。</p><br /><br />
<p>
<strong>REST提出了一些设计概念和准则：</strong> <br /><br />
1.网络上的所有事物都被抽象为资源（resource）；<br /><br />
2.每个资源对应一个唯一的资源标识（resource identifier）；<br /><br />
3.通过通用的连接器接口（generic connector interface）对资源进行操作；<br /><br />
4.对资源的各种操作不会改变资源标识；<br /><br />
5.所有的操作都是无状态的（stateless）。 <br /><br />
</p>
<p>

REST之所以能够简化开发，是因为其引入的架构约束，比如Rails 1.2中对REST的实现默认把controller中的方法限制在7个：index、show、new、edit、create、update和destory，这实际上就是对CURD的实现。更进一步讲，Rails（也是当今大部分网络应用）使用HTTP作为generic connector interface，HTTP则把对一个url的操作限制在了4个之内：GET、POST、PUT和DELETE。 　　
<br /><br />
REST之所以能够提高系统的可伸缩性，是因为它强制所有操作都是stateless的，这样就没有context的约束，如果要做分布式、做集群，就不需要考虑context的问题了。同时，它令系统可以有效地使用pool。REST对性能的另一个提升来自其对client和server任务的分配：server只负责提供resource以及操作resource的服务，而client要根据resource中的data和representation自己做render。这就减少了服务器的开销。 
</p>
<br /><br />
<p>
<strong>REST和MVC的关系。</strong>
<br /><br />
第一个问题假设REST是我们应该采用的架构，然后讨论如何使用；第二个问题则要说明REST和当前最普遍应用的MVC是什么关系，互补还是取代？ <br /><br />
<p>
我们先来谈谈第一个问题，如何使用REST。我感觉，REST除了给我们带来了一个崭新的架构以外，还有一个重要的贡献是在开发系统过程中的一种新的思维方式：通过url来设计系统的结构。根据REST，每个url都代表一个resource，而整个系统就是由这些resource组成的。因此，如果url是设计良好的，那么系统的结构就也应该是设计良好的。对于非高手级的开发人员来说，考虑一个系统如何架构总是一个很抽象的问题。敏捷开发所提倡的Test Driven Development，其好处之一（我觉得是最大的好处）就是可以通过testcase直观地设计系统的接口。比如在还没有创建一个class的时候就编写一个testcase，虽然设置不能通过编译，但是testcase中的方法调用可以很好地从class使用者的角度反映出需要的接口，从而为class的设计提供了直观的表现。这与在REST架构中通过url设计系统结构非常类似。虽然我们连一个功能都没有实现，但是我们可以先设计出我们认为合理的url，这些url甚至不能连接到任何page或action，但是它们直观地告诉我们：系统对用户的访问接口就应该是这样。根据这些url，我们可以很方便地设计系统的结构。
</p>
<br />
由此看来，使用REST的关键是如何抽象资源，抽象得越精确，对REST的应用就越好。因此，如何改变我们目前根深蒂固的基于action的思想是最重要的。

<br /><br />
第二个问题就容易讨论多了。REST会取代MVC吗？还是彼此是互补关系（就像AOP对于OOP）？答案是It depends！如果我们可以把所有的用户需求都可以抽象为资源，那么MVC就可以退出历史的舞台了。如果情况相反，那么我们就需要混合使用REST和MVC。
</p>
	</div>
	<div class="divider"></div>
</div>