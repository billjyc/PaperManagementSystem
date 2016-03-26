﻿<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<style>
	.state3{color:red; margin-left:5px;}
    .state4{color:green; margin-left:5px;}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$(".detailinfo_table tr:even").addClass("detailinfo_table_even");
		$(".detailinfo_table tr:odd").addClass("detailinfo_table_odd");
	});
	
	GetpaperStatus = function() {
		$.post("./getpaperstatus.do", null, function(data) {
			var papers = data.paperstatus;
			var paper_status_CHN = data.paper_status_CHN;
			var bNoPaper = (papers == "UNPROPOSED") || (papers == "PROPOSAL_UNDER_REVIEW") || 
			(papers == "INTERIM_REPORT_UNSUBMITED") || (papers == "INTERIM_REPORT_UNDER_REVIEW") ||
			(papers == "TUTOR_UNASSIGNED");
			if(bNoPaper) {
				$(".update").hide();
				$(".submit").hide();
				$("#changePaperName").hide();
				$("#current_phase").text(paper_status_CHN);
				$("#paper_title_tr").hide();
			} else if (papers != "UNCOMMITED") {
				$(".submit").hide();
				$(".update").show();
				getpaperInfo();
			} else {
				$(".submit").show();
				$(".update").hide();
				$("#current_phase").text("论文未提交");
				$("#changePaperName").hide();
			}
		}, "json");
	};
	GetpaperStatus();
	
	function getpaperInfo() {
		$.post("./getpaper.do", null, function(data) {
			var paper = data.paper;
			var paperstatus = data.paperstatus;
			if(paper != null) {
				$("#paper_title").val(paper.paperTitle);
				$("#current_phase").text(paperstatus);
				$("#changePaperName").show();
				var oldname = new String(paper.paperAddress);
				var newname = paper.paperTitle
						+ oldname.substring(oldname.lastIndexOf("."));
				$("#paper_download").text(newname);
			}
		}, "json");
	}
	function setPaperTitle() {

	}

	submit_paper = function() {
		if ($("input[name='submit_file']").val() == "") {
			alert("请选择文件！");
			return;
		}
		if ($("input[id='paper_title']").val() == "") {
			alert("请填写论文标题！");
			return;
		}
		var title = $("#paper_title").val();
		var affix = $(".submit #affix1").val();
		
		$.ajaxFileUpload({
			url : "./submitpaper.do",
			secureuri : false,
			fileElementId : "submit_file",
			dataType : "json",
			data : {
				"title" : title ,
				"affix" : affix
			},
			success : function(data, status)
			{
				//向教师发送消息
				var message = JSON.stringify({
					'content': encodeURIComponent("学号为" + studentNumber + "的学生提交了论文！")
				});
				var teacherAccountId = data['teacherAccountId'];
				sendMsg(teacherAccountId, message);
				GetpaperStatus();
			},
			error : function(data, status, e)
			{
				GetpaperStatus();
			}
		});
	};

	function update_paper() {
		if ($("input[name='update_file']").val() == "") {
			alert("请选择文件！");
			return;
		}
		var title = $("#paper_title").val();
		var affix = $(".update #affix1").val();
		$.ajaxFileUpload({
			url : "./updatepaper.do",
			secureuri : false,
			fileElementId : "update_file",
			dataType : "json",
			data : {
				title : title,
				affix : affix
			},
			success : function(data, status) //相当于java中try语句块的用法
			{
				//向教师发送消息
				var message = JSON.stringify({
					'content': encodeURIComponent("学号为" + studentNumber + "的学生更新了论文！")
				});
				var teacherAccountId = data['teacherAccountId'];
				sendMsg(teacherAccountId, message);
				GetpaperStatus();
			},
			error : function(data, status, e) //相当于java中catch语句块的用法
			{
				GetpaperStatus();
			}
		});
	}

	function changePaperName() {
		var title = $("#paper_title").val();
		
		if(title == "") {
			var errorMsg = "请输入论文标题！";	
			alert(errorMsg);
			return false;
		}
		
		$.post("./updatepapername.do", {
			title : title
		}, function(date) {
			GetpaperStatus();
		}, "json");
	}
	
	$('input[id="paper_title"]').focus(function(){
		$(this).next().next().text("论文标题不能为空").addClass("state3").removeClass("state4");
	}).blur(function(){
		if($(this).val() == "") {
			$(this).next().next().text("论文标题不能为空").addClass("state3").removeClass("state4");
		}else{
			$(this).next().next().text("ok").addClass("state4").removeClass("state3");
		}
	})

	function downloadpaper() {
		var url = "./downloadpaper.do";
		var method='post';
		jQuery(
				'<form action="' + url + '" method="' + (method || 'post')
						+ '"></form>').appendTo('body').submit()
				.remove();
	}

</script>

<div class="paper_state">
	<table class="info_table">
		<tbody>
			<tr align="center">
				<th>论文状态</th>
			</tr>
			<tr>
				<td>
					<table class="detailinfo_table">
						<tbody>
							<tr id="paper_title_tr">
								<td class="info_mark">论文题目:</td>
								<td class="info_content"><input type="text"
									id="paper_title" /><a href="javascript:void(0)"
									onclick="changePaperName()" id="changePaperName">更改</a><span class="state4"></span></td>
							</tr>
							<tr>
								<td class="info_mark">当前阶段:</td>
								<td id="current_phase" class="info_content"></td>
							</tr>
							<tr class="submit">
								<td class="info_mark">上传论文:</td>
								<td class="info_content"><input id="submit_file"
									name="submit_file" type="file" value="" /></td>
							</tr>
							<tr class="submit">
								<td class="info_mark">文件附言:</td>
								<td class="info_content"><textarea id="affix1" rows="4"
										cols="40">无</textarea> <input type="button" id="submit_button"
									onclick="submit_paper()" value="上传" />
								</td>
							</tr>
							<tr class="update">
								<td class="info_mark">论文:</td>
								<td class="info_content"><a href="javascript:void(0)"
									id="paper_download" onclick="downloadpaper()"></a>
								</td>
							</tr>
							<tr class="update">
								<td class="info_mark">导师评语:</td>
								<td class="info_content"><textarea id="affix2" rows="4"
										disabled="disabled" cols="40">无</textarea>
								</td>
							</tr>
							<tr class="update">
								<td class="info_mark">更新论文:</td>
								<td class="info_content"><input id="update_file"
									name="update_file" type="file" value="" /></td>
							</tr>
							<tr class="update">
								<td class="info_mark">文件附言:</td>
								<td class="info_content"><textarea id="affix1" rows="4"
										cols="40">无</textarea> <input type="button" id="update_button"
									onclick="update_paper()" value="更新" />
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
</div>
