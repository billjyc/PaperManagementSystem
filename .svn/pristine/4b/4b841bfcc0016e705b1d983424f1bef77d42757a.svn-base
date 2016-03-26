<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="left_bar">
  	<dl class="sidebar">
  		<dd class="on">
  			<div><a href="javascript:void(0);" onclick="select(this);"><span class="decide_info"></span>课程考勤记录</a></div>
        </dd>
       	<dd class="on">
  			<div><a href="javascript:void(0);" onclick="select(this);"><span class="decide_info"></span>成绩查看</a></div>
        </dd>
  		<dd>
  			<div><a href="javascript:void(0);" onclick="select(this);"><span class="decide_info"></span>论文跟踪</a></div>
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
		var page_map = new Array("absenseRecord.jsp",
							     "gradeRecord.jsp", 
							     "paperRecord.jsp"); 
								 
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