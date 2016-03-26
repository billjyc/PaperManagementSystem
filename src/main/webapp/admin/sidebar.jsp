<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="left_bar">
  	<dl class="sidebar">
  		<dd class="on">
  			<div><a href="javascript:void(0);" onclick="select(this);"><span class="person_info"></span>学生列表</a></div>
  			<ul class="sidebar2">
	  			<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>全日制</a></li>
	  			<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>在职</a></li>
	  		</ul>
  		</dd>
  		<dd><a href="javascript:void(0);" onclick="select(this);"><span class="person_info"></span>教师列表</a></dd>
  	</dl>
</div>
<script type="text/javascript">
	function select(e){
		$(".sidebar dd").removeClass('on');
		$(".sidebar dd div").removeClass('on');
		$(".sidebar2 li").removeClass('on');
		$(e).parent().addClass('on');
		$(e).parent().parent().parent("dd").children("div").addClass('on');
		
		var firstchild_parent=$(e).parent().parent("dd").children("ul");
		if(firstchild_parent)
		  firstchild_parent.children().first().addClass('on');
	}
	
	$(document).ready(function(){
		var page_map = new Array("fullTimeStudentList.jsp",
								 "fullTimeStudentList.jsp",
								 "partTimeStudentList.jsp",
								 "teacherlist.jsp"
								 ); 
								 
		$(".sidebar a").click(function(){
			$.ajax({  
	            type: "post",
	            dataType: "text",
	            url: page_map[$(".sidebar a").index(this)],
	            success: function(data){$(".main_container").html(data);}  
            });  
		});		
		
		$(".sidebar a:eq(0)").click();
	
	});
</script>