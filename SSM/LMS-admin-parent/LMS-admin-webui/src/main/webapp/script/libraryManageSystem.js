$(function(){
	
	

	$(".LMS-main-bar").on("click","ul li",function () {
		$(".LMS-main-bar ").children("ul").children("li").removeClass("active")
		$("#LMS-main-icon").css("display","none")
		$(this).addClass("active")
	})
	
	$("#LMS-main-side").children("ul").children("li").click(function(){
		$("#LMS-main-side ").children("ul").children("li").removeClass("active")
		$(this).addClass("active")
		$("#LMS-main-content").remove()
		$("#LMS-main-icon").css("display","block")
		var id = $(this).attr("id")
		switch(id){
			case 'side-1':
			$("#bar1").css("display","block")
			$("#bar2").css("display","none")
			$("#bar3").css("display","none")
			$("#bar4").css("display","none")
			break;
			case 'side-2':
				$("#bar1").css("display","none")
				$("#bar2").css("display","block")
				$("#bar3").css("display","none")
				$("#bar4").css("display","none")
			break;
			case 'side-3':
				$("#bar1").css("display","none")
				$("#bar2").css("display","none")
				$("#bar3").css("display","block")
				$("#bar4").css("display","none")
			break;
			case 'side-4':
				$("#bar1").css("display","none")
				$("#bar2").css("display","none")
				$("#bar3").css("display","none")
				$("#bar4").css("display","block")
			break;
		}
		
		
	})
	
	
	
	
	
})