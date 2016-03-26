﻿<script type="text/javascript">
	$(document).ready(function() {
		$(".detailinfo_table tr:even").addClass("detailinfo_table_even");
		$(".detailinfo_table tr:odd").addClass("detailinfo_table_odd");
		
		
	});

	GetStudentInfo = function() {
		$.post("./studentInfo.do", null, function(data) {
			var student = data.student;
			$("[id='name']").text(student.studentName);
			$("[id='no']").text(student.studentNumber);
			$("[name='email']").attr("value", student.studentEmail);
			$("[name='phone']").attr("value", student.studentPhone);
			$("[id='class']").text(student.studentGrade);
		}, "json");
	};
	GetStudentInfo();

	function updateinfo() {
		var email = $("[name='email']").val();
		var phone = $("[name='phone']").val();
		$.post("./updatestudentInfo.do", {
			email : email,
			phone : phone
		}, function(data) {
			alert("Update successful!");
		}, "json");
	}
	function changePassword() {

		var oPassword = $("[name='oPassword']").val();
		var nPassword = $("[name='nPassword']").val();
		$.post("./changePassword.do", {
		
			oPassword : oPassword,
			nPassword : nPassword
		}, function(data) {
			alert(data.result_json);
			/*if(data.result_json=="success"){
				alert("修改密码成功！");
			}else{
				alert("旧密码输入有误，修改失败");
			}*/
			//alert("changepassword successful!");
		}, "json");
	}
	
</script>
<div class="student_info">
	<table class="info_table">
		<tbody>
			<tr align="center">
				<th>学生信息</th>
			</tr>
			<tr>
				<td>
					<table class="detailinfo_table">
						<tbody>
							<tr>
								<td class="info_mark">学生姓名:</td>
								<td class="info_content" id="name"></td>
							</tr>
							<tr>
								<td class="info_mark">学号:</td>
								<td class="info_content" id="no"></td>
							</tr>
							<tr>
								<td class="info_mark">电子邮箱:</td>
								<td class="info_content"><input type="text" name="email" />
								</td>
							</tr>
							<tr>
								<td class="info_mark">联系方式:</td>
								<td class="info_content"><input type="text" name="phone" />
								</td>
							</tr>
							<tr>
								<td class="info_mark">班级:</td>
								<td class="info_content" id="class"></td>
							</tr>
							<tr>
								<td />
								<td class="info_content"><input type="button" value="更新"
									onclick="updateinfo()" /></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
		</tbody>
	</table>
</div>
<div class="student_info">
	<table class="info_table">
		<tbody>
			<tr align="center">
				<th>密码修改</th>
			</tr>
			<tr>
				<td>
					<table class="detailinfo_table">
						<tbody>
						
			
							</tr>
								<tr>
								<td class="info_mark">原密码:</td>
								<td class="info_content"><input type="password" name="oPassword" />
								</td>
							</tr>
							<tr>
								<td class="info_mark">新密码:</td>
								<td class="info_content"><input type="password" name="nPassword" />
								</td>
							</tr>
						
							<tr>
								<td />
								<td class="info_content"><input type="button" value="修改"
									onclick="changePassword()" /></td>
							</tr>
						</tbody>
					</table></td>
			</tr>
		</tbody>
	</table>
</div>
