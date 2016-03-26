<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="left_bar">
  	<dl class="sidebar">
  		<dd>
  			<div class="on"><a href="javascript:void(0);" onclick="select(this);"><span class="review_info"></span>评审工作</a></div>
  			<ul class="sidebar2" id="menu1">
  				<li class="on"><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>未处理列表</a></li>
  				<li><a href="javascript:void(0);" onclick="select(this);"><span class="child_info"></span>已处理列表</a></li>
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
		$("#menu1 a:eq(0)").click(function(){
			$.post("review_list.jsp",{},function(data){
				$(".main_container").html(data);
			},"text");
		});
		$("#menu1 a:eq(1)").click(function(){
			$.post("reviewed_list.jsp",{},function(data){
				$(".main_container").html(data);
			},"text");
		});
	});
	
	
</script>