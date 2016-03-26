<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="left_bar">
	<!--    	<div class="welcome">欢迎你，教师！</div> -->
	<dl class="sidebar">
		<dd class="on">
			<a href="javascript:void(0);" onclick="select(this);"><span
				class="person_info"></span>指导学生信息<b id="studentInfo"></b></a>
		</dd>
		<dd>
			<div>
				<a href="javascript:void(0);" onclick="select(this);"><span
					class="paper_info"></span>论文列表</a>
			</div>
			<ul class="sidebar2" id="menu1">

				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>待审开题报告<b id="uncheckedProposal"></b></a></li>
				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>已通过开题报告<b id="passedProposal"></b></a></li>
				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>待审中期检查<b id="uncheckedInterim"></b></a></li>
				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>已通过中期检查<b id="passedInterim"></b></a></li>
				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>所有论文<b id="allThesis"></b></a></li>
				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>待初步定稿<b id="firstCheck"></b></a></li>
				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>待答辩前定稿<b id="beforeDefense"></b></a></li>
				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>暂缓答辩前定稿<b id="reprieveList"></b></a></li>
				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>待答辩后定稿<b id="defenseFinalized"></b></a></li>
				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>已归档<b id="completePaper"></b></a></li>
			</ul>
		</dd>
		<dd>
			<div>
				<a href="javascript:void(0);" onclick="select(this);"><span
					class="email_info"></span>消息处理</a>
			</div>
			<ul class="sidebar2" id="menu2">
				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>发起会话</a></li>
				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>待回复列表<b id="needReply"></b></a></li>
				<li><a href="javascript:void(0);" onclick="select(this);"><span
						class="child_info"></span>已发送列表<b id="sendList"></b></a></li>
			</ul>
		</dd>
		<dd>
			<a href="javascript:void(0);" onclick="select(this);"><span
				class="record_info"></span>交互日志<b id="inbox"></b></a>
		</dd>
	</dl>
</div>
<script type="text/javascript">
	function select(e) {
		$(".sidebar dd").removeClass('on');
		$(".sidebar dd div").removeClass('on');
		$(".sidebar2 li").removeClass('on');
		$(e).parent().addClass('on');
		$(e).parent().parent().parent("dd").children("div").addClass('on');
		var firstchild_parent = $(e).parent().parent("dd").children("ul");
		if (firstchild_parent)
			firstchild_parent.children().first().addClass('on');
		//receiveMsg(accountId);
	}
</script>