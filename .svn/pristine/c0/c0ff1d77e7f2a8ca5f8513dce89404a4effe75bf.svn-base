<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script type="text/javascript">
	GetPaperProcess = function() {
		$.post("./getpaperprocess.do", null, function(data) {
			var currentphase = data.currentphase;
			var proposalfile = data.proposalfile;
			var interimreportfile = data.interimreportfile;
			$("#before").hide();
			if (currentphase == "TUTOR_UNASSIGNED") {
				$("#before").show();
				$("#proposal").hide();
				$("#interimreport").hide();
			} else if (currentphase == "UNPROPOSED") {
				$("#interimreport").hide();
				$("#proposal_submit").show();
				$("#proposal_update").hide();
			} else if (currentphase == "INTERIM_REPORT_UNSUBMITED") {
				$("#proposal_download").text(proposalfile);
				$("#proposal_submit").hide();
				$("#proposal_update").hide();
				$("#interimreport_submit").show();
				$("#interimreport_update").hide();
			} else if (currentphase == "PROPOSAL_UNDER_REVIEW") {
				$("#interimreport").hide();
				$("#proposal_download").text(proposalfile);
				$("#proposal_submit").hide();
				$("#proposal_update").show();
			} else if (currentphase == "INTERIM_REPORT_UNDER_REVIEW") {
				$("#proposal_download").text(proposalfile);
				$("#proposal_submit").hide();
				$("#proposal_update").hide();
				$("#interimreport_download").text(interimreportfile);
				$("#interimreport_submit").hide();
				$("#interimreport_update").show();
			} else {
				$("#proposal_download").text(proposalfile);
				$("#proposal_submit").hide();
				$("#proposal_update").hide();
				$("#interimreport_download").text(interimreportfile);
				$("#interimreport_submit").hide();
				$("#interimreport_update").hide();
			} /* else {
				$("#proposal").hide();
				$("#interimreport").hide();
			} */
		}, "json");
	};
	GetPaperProcess();

	submit_proposal = function() {
		if ($("input[name='submit_proposal_file']").val() == "") {
			alert("请选择文件！");
			return;
		}

		$.ajaxFileUpload({
			url : "./submitproposal.do",
			secureuri : false,
			fileElementId : "submit_proposal_file",
			dataType : "json",
			success : function(data, status) {
				var teacherAccountId = data['teacherAccountId'];
				var message = JSON.stringify({
					'content': encodeURIComponent("学号为" + studentNumber + "的学生提交了开题报告！"),
				});
				sendMsg(teacherAccountId, message);
				GetPaperProcess();
			},
			error : function(data, status, e) {
				GetPaperProcess();
			}
		});
	};

	update_proposal = function() {
		if ($("input[name='update_proposal_file']").val() == "") {
			alert("请选择文件！");
			return;
		}

		$.ajaxFileUpload({
			url : "./updateproposal.do",
			secureuri : false,
			fileElementId : "update_proposal_file",
			dataType : "json",
			success : function(data, status) {
				//向教师发送消息
				var message = JSON.stringify({
					'content': encodeURIComponent("学号为" + studentNumber + "的学生更新了开题报告！")
				});
				var teacherAccountId = data['teacherAccountId'];
				sendMsg(teacherAccountId, message);
				
				GetPaperProcess();
			},
			error : function(data, status, e) {
				GetPaperProcess();
			}
		});
	};

	submit_interimreport = function() {
		if ($("input[name='submit_interimreport_file']").val() == "") {
			alert("请选择文件！");
			return;
		}

		$.ajaxFileUpload({
			url : "./submitinterimreport.do",
			secureuri : false,
			fileElementId : "submit_interimreport_file",
			dataType : "json",
			success : function(data, status) {
				//向教师发送消息
				var message = JSON.stringify({
					'content': encodeURIComponent("学号为" + studentNumber + "的学生提交了中期报告！")
				});
				var teacherAccountId = data['teacherAccountId'];
				sendMsg(teacherAccountId, message);
				GetPaperProcess();
			},
			error : function(data, status, e) {
				GetPaperProcess();
			}
		});
	};

	update_interimreport = function() {
		if ($("input[name='update_interimreport_file']").val() == "") {
			alert("请选择文件！");
			return;
		}

		$.ajaxFileUpload({
			url : "./updateinterimreport.do",
			secureuri : false,
			fileElementId : "update_interimreport_file",
			dataType : "json",
			success : function(data, status) {
				//向教师发送消息
				var message = JSON.stringify({
					'content': encodeURIComponent("学号为" + studentNumber + "的学生更新了中期报告！")
				});
				var teacherAccountId = data['teacherAccountId'];
				sendMsg(teacherAccountId, message);
				GetPaperProcess();
			},
			error : function(data, status, e) {
				GetPaperProcess();
			}
		});
	};

	function download_proposal() {
		var url = "./downloadproposal.do";
		var method = 'post';
		jQuery(
				'<form action="' + url + '" method="' + (method || 'post')
						+ '"></form>').appendTo('body').submit().remove();
	}

	function download_interimreport() {
		var url = "./downloadinterimreport.do";
		var method = 'post';
		jQuery(
				'<form action="' + url + '" method="' + (method || 'post')
						+ '"></form>').appendTo('body').submit().remove();
	}
</script>

<div class="paper_state">
	<table id="before" class="info_table">
		<tbody>
			<tr align="center">
				<th>导师未分配！</th>
			</tr>
		</tbody>
	</table>
	<table id="proposal" class="info_table">
		<tbody>
			<tr align="center">
				<th>开题报告</th>
			</tr>
			<tr>
				<td>
					<table class="detailinfo_table">
						<tbody>
							<tr class="detailinfo_table_even">
								<td class="info_mark">开题报告:</td>
								<td class="info_content"><a href="javascript:void(0)"
									id="proposal_download" onclick="download_proposal()"></a></td>
							</tr>
							<tr id="proposal_submit" class="detailinfo_table_odd">
								<td class="info_mark">上传:</td>
								<td class="info_content"><input id="submit_proposal_file"
									name="submit_proposal_file" type="file" value="" /><input
									type="button" name="proposal_submit_button" id="submit_button"
									onclick="submit_proposal()" value="上传" />
								</td>
							</tr>
							<tr id="proposal_update" class="detailinfo_table_odd">
								<td class="info_mark">上传:</td>
								<td class="info_content"><input id="update_proposal_file"
									name="update_proposal_file" type="file" value="" /><input
									type="button" name="proposal_update_button" id="update_button"
									onclick="update_proposal()" value="更新" />
								</td>
							</tr>
						</tbody>
					</table></td>
			</tr>
		</tbody>
	</table>
	<table id="interimreport" class="info_table">
		<tbody>
			<tr align="center">
				<th>中期检查</th>
			</tr>
			<tr>
				<td>
					<table class="detailinfo_table">
						<tbody>
							<tr class="detailinfo_table_even">
								<td class="info_mark">中期检查:</td>
								<td class="info_content"><a href="javascript:void(0)"
									id="interimreport_download" onclick="download_interimreport()"></a>
								</td>
							</tr>
							<tr id="interimreport_submit" class="detailinfo_table_odd">
								<td class="info_mark">上传:</td>
								<td class="info_content"><input
									id="submit_interimreport_file" name="submit_interimreport_file"
									type="file" value="" /><input type="button"
									name="interimreport_submit_button" id="submit_button"
									onclick="submit_interimreport()" value="上传" />
								</td>
							</tr>
							<tr id="interimreport_update" class="detailinfo_table_odd">
								<td class="info_mark">上传:</td>
								<td class="info_content"><input
									id="update_interimreport_file" name="update_interimreport_file"
									type="file" value="" /><input type="button"
									name="interimreport_update_button" id="update_button"
									onclick="update_interimreport()" value="更新" />
								</td>
							</tr>
						</tbody>
					</table></td>
			</tr>
		</tbody>
	</table>
</div>
