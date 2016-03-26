<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="left_bar">
  	<dl class="sidebar">
  		<dd class="on">
  			<div><a href="javascript:void(0);" onclick="select(this);"><span class="decide_info"></span>班主任列表</a></div>
  			

  		
  		<dd>
  			<div><a href="javascript:void(0);" onclick="select(this);"><span class="decide_info"></span>教学点负责人列表</a></div>
  			
  		</dd>
  		<dd>
  			<div><a href="javascript:void(0);" onclick="select(this);"><span class="decide_info"></span>教学点列表</a></div>
  			
  		</dd>
  		<dd>
  			<div><a href="javascript:void(0);" onclick="select(this);"><span class="decide_info"></span>教学点班级信息列表</a></div>
  			<ul class="sidebar2">
  				<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>学生班级分配</a></li>
	  		</ul>
	  		
	  		<ul class="sidebar2">
  				<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>已分配班级列表</a></li>
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
		var page_map = new Array("headTeacher.jsp",
		                         "director.jsp",
							     "teachingPoint.jsp",
							     "teachPointClass.jsp",
							     "assignClass.jsp",
							     "classAssignedList.jsp"); 
								 
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