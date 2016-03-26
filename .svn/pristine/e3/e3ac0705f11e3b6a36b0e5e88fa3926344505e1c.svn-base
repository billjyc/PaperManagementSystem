<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="left_bar">
  	<dl class="sidebar">
  		<dd class="on">
  			<div><a href="javascript:void(0);" onclick="select(this);"><span class="decide_info"></span>课程列表</a></div>
  			<ul class="sidebar2">
	  			<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>待选课</a></li>
	  			<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>已选课程信息</a></li>
	  		</ul>
  		</dd>

  		
  		<dd>
  			<div><a href="javascript:void(0);" onclick="select(this);"><span class="decide_info"></span>成绩审核</a></div>
  			<ul class="sidebar2">
  				<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>待审核成绩单</a></li>
	  		</ul>
	  		
	  		<ul class="sidebar2">
  				<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>已审核成绩单</a></li>
	  		</ul>
  		</dd>
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
		var page_map = new Array("course_list.jsp",
		                         "assignCourse.jsp",
							     "courseAssignedList.jsp",
							     "transcript.jsp",
							     "unchecked_transcript.jsp",
							     "checked_transcript.jsp"); 
								 
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