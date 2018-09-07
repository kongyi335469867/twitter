$(document).ready(function(){
	/*头部倒三角处下拉框移入移出*/
	$(document).on("mouseenter",".header-bar-nav",function(){
	    $(this).addClass("open");
	});
	$(document).on("mouseleave",".header-bar-nav",function(){
	    $(this).removeClass("open");
	});

	/*响应式显示的头部菜单按钮点击事件*/
	$(".header-menu-btn").click(function(){
	    $(".layout-side").removeClass("close").slideToggle();
	    $(".menu-header").css("display","none");
	    $(".lay-main").removeClass("full-page");
	    $(".layout-footer").removeClass("full-page");
	    $(".layout-side-arrow-icon").removeClass("close");
	});

	/*侧栏点击事件*/
	$(".side-menu").on('click', 'li a', function() {
	    var $this = $(this);
	    openPage($this);
	});
	function openPage(cur){
	    var $this = cur;
	    var id = $this.attr("id");
	    var value = $this.find("span").text();
	    var tabId = $(".content-tab").attr("id");
	    if(id == tabId){
	        return false;
	    }
	   if(id == "homepage"){
	       $("#index").text(value);
	       //$(".body-iframe").attr("src","homepage.jsp");
	   }else if(id == "memberCenter"){
	       $("#index").text(value);
	       //$(".body-iframe").attr("src","memberCenter.jsp");
	   }else if(id == "tweetCenter"){
	       $("#index").text(value);
	       //$(".body-iframe").attr("src","tweetCenter.jsp");
	   }else if(id == "aboutBackstage"){
	       $("#index").text(value);
	       //$(".body-iframe").attr("src","aboutBackstage.jsp");
	   }
	}

	/*左侧菜单图标点击事件*/
	$(".menu-header").click(function(){
	    if($(".layout-side").hasClass("hide")){
	        $(".menu-item-word").css("display","inline-block");
	        $(".layout-side").removeClass("hide");
	        $(".layout-main").removeClass("hide-page");
	        $(".layout-footer").removeClass("hide-page");
	    }else{
	        $(".menu-item-word").css("display","none");
	        $(".layout-side").addClass("hide");
	        $(".layout-main").addClass("hide-page");
	        $(".layout-footer").addClass("hide-page");
	    }
	});

	/*左侧菜单栏点击选中元素样式，移除未选中元素样式*/
	$(".side-menu .menu-item").click(function(){
	    $(this).addClass(" item_active");
	    var item = $(".side-menu .menu-item");
	    var index = $(this).index();
	    for(var i = 1; i < item.length; i++){
	        if(i != index){
	            if($(item[i]).hasClass("item_active")){
	                $(item[i]).removeClass("item_active");
	            }
	        }
	    }
	});
});

