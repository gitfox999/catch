$(function() {
	// dwz初始化
	DWZ.init($weburl + "/dwz/dwz.frag.xml", {
		loginUrl : $weburl + "/login/0/loginDialog",loginTitle : "登录", // 弹出登录对话框
		statusCode : {ok : 200, error : 300, timeout : 301}, // 【可选】
		pageInfo:{pageNum:"pageNum", numPerPage:"numPerPage", orderField:"orderField", orderDirection:"orderDirection"}, //【可选】
		debug : false, // 调试模式 【true|false】
		callback : function() {
			initEnv();
			$("#themeList").theme({themeBase : "themes"}); // themeBase 相对于index页面的主题base路径
		}
	});
	
	// 载入登录验证码
	$("#j_code").live(
			"focus",
			function() {
				$("#code_img").attr("src",$("#code_img").attr("codesrc") + "?id="+ Math.random());
			});

	
	$(".fullTextSearch span").live("click", function() {
		var $pt = navTab.getCurrentPanel();		
		var $fullTextSearchform=$pt.find(".fullTextSearchForm");
		var $advancedSearchform=$pt.find(".advancedSearchForm");
		$advancedSearchform.slideUp(500);
		$advancedSearchform.attr("rel","pagerForm_hidden");
		$fullTextSearchform.attr("rel","pagerForm");
		$('body').oneTime(700,function(){
			$fullTextSearchform.slideDown(500);
		});
	});

	$(".advancedSearch span").live("click", function() {
		var $pt = navTab.getCurrentPanel();
		var $fullTextSearchform=$pt.find(".fullTextSearchForm");
		var $advancedSearchform=$pt.find(".advancedSearchForm");
		$fullTextSearchform.slideUp(500);
		$fullTextSearchform.attr("rel","pagerForm_hidden");
		$advancedSearchform.attr("rel","pagerForm");
		$('body').oneTime(700,function(){
			$advancedSearchform.slideDown(500);
		});		
	});

});