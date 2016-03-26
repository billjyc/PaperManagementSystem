<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="left_bar">
  	<dl class="sidebar">
  		<dd class="on">
  			<ul class="sidebar2">
	  			<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>指导费用发放</a></li>
	  			<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>评审费用发放</a></li>
	  			<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>答辩费用发放</a></li>
	  			<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>二次评审费用收取</a></li>
	  			<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>二次答辩费用收取</a></li>
	  			<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>二次评审费用发放</a></li>
	  			<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>二次答辩费用发放</a></li>
	  		</ul>
  		</dd>
  		  		
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
		var page_map = new Array("instruction_fee_list.jsp",
								 "judge_fee_list.jsp",
								 "defence_fee_list.jsp",
								 "second_judge_fee_charge.jsp",
								 "second_defence_fee_charge.jsp",
								 "second_judge_fee_grant.jsp",
								 "second_defence_fee_grant.jsp"); 
								 
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