<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<style>
	.list {float:left;margin-left:10px;}
	.table_title{width:100%;text-align:center;color:#526293;font-size:12px;}
	#swing_box{position:fixed;right:-350px;top:150px;}
	#swing_button{
		width:25px;height:100px;
		font-size:12px;text-align:center;font-weight: bold;color: #2e6e9e;
		position:absolute;left:-25px;top:200px;
		border-top-left-radius: 10px;-moz-border-top-left-radius: 10px;webkit-border-top-left-radius: 10px;
		border-bottom-left-radius: 10px;-moz-border-bottom-left-radius: 10px;webkit-border-bottom-left-radius: 10px;
		background: #d3d3d3 url(../css/images/sprites.png) repeat 0 -1950px;
		border: 1px solid #d3d3d3;
		cursor: pointer;
	}
</style>

<script>
	var rowID = 0;
	
	function upload(data){
      $.ajaxFileUpload({
            url:"./importFeeOFJudgeExcel.do",            //需要链接到服务器地址
            secureuri:false,
            fileElementId:"file",                        //文件选择框的id属性
            dataType: "json",                                     //服务器返回的格式，可以是json
            success: function (data, status){ 
                 alert(data.result);
            },
            error: function (data, status, e){
                 alert(data.result);
            }
      });
	}
	
	function submit_assign(){
		var data = $("#assigned_list").getRowData();
		if(data != ""){
			var postData = "list=" + JSON.stringify(data)+
						   "&time=2015-06-03 12:13:14"+
						   "&address=南京大学费彝民楼";
			$.ajax({
				type: 'POST',
				url: './assigndefense.do',
				data: postData,
				dataType: 'json',
				beforeSend: function(){
					var win = $.messager.progress({  
		                title:'Please waiting',  
		                msg:'正在分配答辩...',
		                interval: 300
		            });  
				},
				complete: function(){
					$.messager.progress('close');
				},
				success: function(msg) {
					if(msg.result_json == "success"){
						alert("分配答辩完成！");
						$("#assigned_list").clearGridData();
						reloadAll();
					} else {
						var conflict_list = msg.conflict_list;
						//如果分配的答辩老师为学生自己的导师，所有分配结果失效
						if(conflict_list.length > 0) {
							var msg = "分配答辩老师失败，学号为";
							$.each(conflict_list, function(n, value) {
								msg += value.studentNumber;
								msg += ",";
							});
							msg += "的学生分配的答辩老师与自己的导师重复！";
							alert(msg);
						}
						//重新加载学生列表
						$.ajax({
							type: 'POST',
							url: "assigndefenselist.do",
							dataType: "json",
							success: function(data) {
								console.log(data);
								$("#student_list").jqGrid('setGridParam',{
									data: data.studentlist,
									dataType: 'local'
								}).trigger("reloadGrid");
							},
							error: function() {
								alert("获取学生列表出错！");
							}
						});
					}
					$("#assigned_list").clearGridData();
					reloadAll();
				},
				error: function() {
					alert("分配答辩失败！");
				}
			});
			/* $.post("./assigndefense.do",postData,function(msg){
				//alert("正在分配，稍安勿躁...");
				if(msg.result_json == "success"){
					alert("分配完成！");
					$("#assigned_list").clearGridData();
					reloadAll();
				} else {
					var conflict_list = msg.conflict_list;
					//如果分配的答辩老师为学生自己的导师，所有分配结果失效
					if(conflict_list.length > 0) {
						var msg = "分配答辩老师失败，学号为";
						$.each(conflict_list, function(n, value) {
							msg += value.studentNumber;
							msg += ",";
						});
						msg += "的学生分配的答辩老师与自己的导师重复！";
						alert(msg);
					}
					//重新加载学生列表
					$.ajax({
						type: 'POST',
						url: "assigndefenselist.do",
						dataType: "json",
						success: function(data) {
							console.log(data);
							$("#student_list").jqGrid('setGridParam',{
								data: data.studentlist,
								dataType: 'local'
							}).trigger("reloadGrid");
						},
						error: function() {
							alert("获取学生列表出错！");
						}
					});
				}
				$("#assigned_list").clearGridData();
				reloadAll();
			},"json"); */
		}else{
			alert("没有分配信息！");
		}
	}
	
	$.post("assigndefenselist.do",{},function(data){
		var assignedlist = [];
		
		$("#student_list").jqGrid({
			data: data.studentlist,	
	     	datatype: 'local',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
	     	colNames:['ID','学号','学生姓名','年级','攻读学位','类型','联系电话','备用电话','邮件地址'],		//表格的显示字段
			colModel:[    
			{name:'studentId',index:'studentId',hidden:true},
	        {name:'studentNumber',width:100,resizable:false,align:"center",sortable:true},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
	        {name:'studentName',width:100,resizable:false,align:"center"},    
	        {name:'studentGrade',hidden:true,viewable:true,editrules:{edithidden:true}},
			{name:'studentDegreeType',hidden:true,viewable:true,editrules:{edithidden:true}},
		    {name:'studentType',hidden:true,viewable:true,editrules:{edithidden:true}},
	        {name:'studentPhone1',hidden:true,viewable:true,editrules:{edithidden:true}},      
	        {name:'studentPhone2',hidden:true,viewable:true,editrules:{edithidden:true}},      
	        {name:'studentEmail',hidden:true,viewable:true,editrules:{edithidden:true}}
	     	],    
			pgbuttons: false,
    		pgtext: null,
			multiselect: true,
			rowNum: 999,
			viewrecords: true,
			height:"400px",  
			width : 230, 
	     
	     	loadComplete:function(data){ //完成服务器请求后，回调函数
			  if(data.length == 0){
				$("#student_list").append('<tr><td colspan="2">&nbsp;&nbsp;暂无记录！</td></tr>');
			  }
		    },
			
			ondblClickRow : function(id){
				$("#student_list").jqGrid('viewGridRow', id, {closeOnEscape:true} );
			}
		});
		
		$("#teacher1_list").jqGrid({
			data: data.chairmanList,	
	     	datatype: 'local',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
	     	colNames:['ID','编号','答辩主席','类别','学历','职称','联系电话','邮件地址'],		//表格的显示字段
			colModel:[    
			{name:'teacherId',index:'teacherId',hidden:true},
	        {name:'teacherNumber',hidden:true,viewable:true,editrules:{edithidden:true}},
	        {name:'teacherName',width:100,sortable:false,resizable:false,align:"center"},    
			{name:'teacherClasses',hidden:true,viewable:true,editrules:{edithidden:true}},  
			{name:'teacherEducation',hidden:true,viewable:true,editrules:{edithidden:true}},
			{name:'teacherJobTitle',hidden:true,viewable:true,editrules:{edithidden:true}},  
	        {name:'teacherPhone',hidden:true,viewable:true,editrules:{edithidden:true}},      
	        {name:'teacherEmail',hidden:true,viewable:true,editrules:{edithidden:true}}
	     	],    
			pgbuttons: false,
    		pgtext: null,
    		rowNum: 999,
			multiselect: false,
			viewrecords: true,
			height: "400px",   
			width : 100,
	     
	     	loadComplete:function(data){ 
			  if(data.length == 0){
				$("#teacher1_list").append('<tr><td colspan="1">&nbsp;&nbsp;暂无记录！</td></tr>');
			  }
		    },
			
			ondblClickRow : function(id){
				$("#teacher1_list").jqGrid('viewGridRow', id, {closeOnEscape:true});
			}
		});
		
		$("#teacher2_list").jqGrid({
			data: data.teacherlist,	
	     	datatype: 'local',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
	     	colNames:['ID','编号','答辩评委1','类别','学历','职称','联系电话','邮件地址'],		//表格的显示字段
			colModel:[    
			{name:'teacherId',index:'teacherId',hidden:true},
	        {name:'teacherNumber',hidden:true,viewable:true,editrules:{edithidden:true}},
	        {name:'teacherName',width:100,sortable:false,resizable:false,align:"center"},    
			{name:'teacherClasses',hidden:true,viewable:true,editrules:{edithidden:true}},  
			{name:'teacherEducation',hidden:true,viewable:true,editrules:{edithidden:true}},
			{name:'teacherJobTitle',hidden:true,viewable:true,editrules:{edithidden:true}},  
	        {name:'teacherPhone',hidden:true,viewable:true,editrules:{edithidden:true}},      
	        {name:'teacherEmail',hidden:true,viewable:true,editrules:{edithidden:true}}
	     	],    
			pgbuttons: false,
    		pgtext: null,
			multiselect: false,
			viewrecords: true,
			height: "400px",
			rowNum: 999,
			width : 100,
	     
	     	loadComplete:function(data){ 
			  if(data.length == 0){
				$("#teacher2_list").append('<tr><td colspan="1">&nbsp;&nbsp;暂无记录！</td></tr>');
			  }
		    },
			
			ondblClickRow : function(id){
				$("#teacher2_list").jqGrid('viewGridRow', id, {closeOnEscape:true});
			}
		});
		
		$("#teacher3_list").jqGrid({
			data: data.teacherlist,	
	     	datatype: 'local',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
	     	colNames:['ID','编号','答辩评委2','类别','学历','职称','联系电话','邮件地址'],		//表格的显示字段
			colModel:[    
			{name:'teacherId',index:'teacherId',hidden:true},
	        {name:'teacherNumber',hidden:true,viewable:true,editrules:{edithidden:true}},
	        {name:'teacherName',width:100,sortable:false,resizable:false,align:"center"},    
			{name:'teacherClasses',hidden:true,viewable:true,editrules:{edithidden:true}},  
			{name:'teacherEducation',hidden:true,viewable:true,editrules:{edithidden:true}},
			{name:'teacherJobTitle',hidden:true,viewable:true,editrules:{edithidden:true}},  
	        {name:'teacherPhone',hidden:true,viewable:true,editrules:{edithidden:true}},      
	        {name:'teacherEmail',hidden:true,viewable:true,editrules:{edithidden:true}}
	     	],    
			pgbuttons: false,
    		pgtext: null,
			multiselect: false,
			viewrecords: true,
			height: "400px",  
			rowNum: 999,
			width : 100,
	     
	     	loadComplete:function(data){ 
			  if(data.length == 0){
				$("#teacher3_list").append('<tr><td colspan="1">&nbsp;&nbsp;暂无记录！</td></tr>');
			  }
		    },
			
			ondblClickRow : function(id){
				$("#teacher3_list").jqGrid('viewGridRow', id, {closeOnEscape:true});
			}
		});
		
		$("#secretary_list").jqGrid({
			data: data.secretarylist,	
	     	datatype: 'local',    
	     	colNames:['ID','编号','答辩秘书','类别','学历','职称','联系电话','邮件地址'],	
			colModel:[    
			{name:'teacherId',index:'teacherId',hidden:true},
	        {name:'teacherNumber',hidden:true,viewable:true,editrules:{edithidden:true}},
	        {name:'teacherName',width:100,sortable:false,resizable:false,align:"center"},    
			{name:'teacherClasses',hidden:true,viewable:true,editrules:{edithidden:true}},  
			{name:'teacherEducation',hidden:true,viewable:true,editrules:{edithidden:true}},
			{name:'teacherJobTitle',hidden:true,viewable:true,editrules:{edithidden:true}},  
	        {name:'teacherPhone',hidden:true,viewable:true,editrules:{edithidden:true}},      
	        {name:'teacherEmail',hidden:true,viewable:true,editrules:{edithidden:true}}
	     	],    
			pgbuttons: false,
    		pgtext: null,
			multiselect: false,
			rowNum: 999,
			viewrecords: true,
			height: "400px",
			width : 100,
	     
	     	loadComplete:function(data){ //完成服务器请求后，回调函数
			  if(data.length == 0){
				$("#secretary_list").append('<tr><td colspan="1">&nbsp;&nbsp;暂无记录！</td></tr>');
			  }
		    },
			
			ondblClickRow : function(id){
				$("#secretary_list").jqGrid('viewGridRow', id, {closeOnEscape:true} );
			}
		});
		
		$("#assigned_list").jqGrid({
			datatype: 'local',
	     	colNames:['teacher1Id','teacher2Id','teacher3Id','secretaryId','评审老师','学生ID','学号','学生姓名','年级','攻读学位','类型','联系电话','备用电话','邮件地址','答辩时间','答辩地址'],		//表格的显示字段
			colModel:[    
			{name:'teacher1Id',hidden:true},
			{name:'teacher2Id',hidden:true},
			{name:'teacher3Id',hidden:true},
			{name:'secretaryId',hidden:true},
			{name:'teacherName',width:100,sortable:false},
			{name:'studentId',index:'studentId',hidden:true},
	        {name:'studentNumber',width:100,resizable:false,sortable:false},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
	        {name:'studentName',width:100,resizable:false,sortable:false},    
	        {name:'studentGrade',hidden:true,viewable:true,editrules:{edithidden:true}},
			{name:'studentDegreeType',hidden:true,viewable:true,editrules:{edithidden:true}},
		    {name:'studentType',hidden:true,viewable:true,editrules:{edithidden:true}},
	        {name:'studentPhone1',hidden:true,viewable:true,editrules:{edithidden:true}},      
	        {name:'studentPhone2',hidden:true,viewable:true,editrules:{edithidden:true}},      
	        {name:'studentEmail',hidden:true,viewable:true,editrules:{edithidden:true}},
	        {name:'deadline',width:150,resizable:false,sortable:false,editable:true}, 
    		{name:'address',width:200,resizable:false,sortable:false,editable:true}
    		],
    		cellEdit:true,
    		cellsubmit: 'local',
			pgbuttons: false,
    		pgtext: null,
    		pager: '#toolBar',
    	    grouping: true,
		    groupingView: {
	        	groupField: ['teacherName'],
	        	groupColumnShow: false
	    	},
	    	loadComplete:function(data){
	    	},
			multiselect: false,
			height: "400px",  
			width : 650,
			
		});
		
		$("#assigned_list").navGrid("#toolBar",{edit:false,add:false,del:false,search:false,refresh:false})
		.navButtonAdd("#toolBar",{  
	   		caption:"导入Excel",   
	   		buttonicon:"ui-icon-plus",  
	   		onClickButton: function(e){
	   			$("#file").click();
	  		}
		})
		.navSeparatorAdd("#toolBar",{
			sepclass : "ui-separator",
			sepcontent: ''
		})
		.navButtonAdd("#toolBar",{
		   caption:"提交分配结果", 
		   buttonicon:"ui-icon-plus", 
		   onClickButton: function(){ 
		  	 submit_assign();
		   }
		});
		
		var show = false;
		$("#swing_button").click(function(){
			if(!show){
				$("#swing_box").animate({right:"0px"},300);
				show = true;
			}
			else{
				$("#swing_box").animate({right:"-300px"},300);
				show = false;	
			}
		});
	},"json");
	
	function reloadAll() {
		$("#student_list").trigger('reloadGrid');
		$("#assigned_list").trigger('reloadGrid');
		$('#teacher1_list').trigger('reloadGrid');
		$('#teacher2_list').trigger('reloadGrid');
		$('#teacher3_list').trigger('reloadGrid');
		$('#secretary_list').trigger('reloadGrid');
	}
	
	function addAssign(){
		var assignedlist = [];
		teacher1Row = $("#teacher1_list").getGridParam('selrow');
		teacher2Row = $("#teacher2_list").getGridParam('selrow');
		teacher3Row = $("#teacher3_list").getGridParam('selrow');
		secretaryRow = $("#secretary_list").getGridParam('selrow');
		if(teacher1Row != null && teacher2Row != null && teacher3Row != null && secretaryRow != null){
			teacher1 = $("#teacher1_list").getRowData(teacher1Row);
			teacher2 = $("#teacher2_list").getRowData(teacher2Row);
			teacher3 = $("#teacher3_list").getRowData(teacher3Row);
			secretary = $("#secretary_list").getRowData(secretaryRow);
			students_rows = $("#student_list").getGridParam('selarrrow');
			
			//不允许4个答辩老师出现重复的情况
			teacher1Id = teacher1['teacherId'];
			teacher2Id = teacher2['teacherId'];
			teacher3Id = teacher3['teacherId'];
			secretaryId = secretary['teacherId'];
			
			var isContainSameTeacher = (teacher1Id == teacher2Id) || (teacher1Id == teacher3Id) ||
				(teacher1Id == secretaryId) || (teacher2Id == teacher3Id) || (teacher2Id == secretaryId) ||
				(teacher3Id == secretaryId);
			if(isContainSameTeacher) {
				alert("选择的答辩老师不能够出现重复！");
				reloadAll();
				return;
			}
			
			// 此处必须从student_rows尾部开始取数据，涉及列表删除操作
			for(var i = students_rows.length - 1; i >= 0; i--){
				var student = $("#student_list").getRowData(students_rows[i]);
				student.teacher1Id = teacher1Id;
				student.teacher2Id = teacher2Id;
				student.teacher3Id = teacher3Id;
				student.secretaryId = secretaryId;
				student.teacherName = "主席:" + teacher1['teacherName']+" 评委1:" + teacher2['teacherName']+" 评委2:" + teacher3['teacherName']+" 秘书:" + secretary['teacherName'];
				console.log("student param:"+teacher1Id+" "+teacher2Id+" "+teacher3Id+" "+secretaryId);
				assignedlist.push(student);
				$("#student_list").delRowData(students_rows[i]);
			}
			$("#assigned_list").setGridParam({'data': assignedlist});
			reloadAll();
		}
	}
	
	function delAssign(){
		var deletedlist = [];
	  	delete_row = jQuery("#assigned_list").getGridParam('selrow');
	  	//console.log("rowID right "+rowID);
		 
		// 此处必须从assigned_list尾部开始取数据，涉及列表删除操作
		var delAssign = $("#assigned_list").getRowData(delete_row);
		if(delete_row != null){
			deletedlist.push(delAssign);
			}
		$("#assigned_list").delRowData(delete_row);
		
		//console.log("assignedlist[0] teacherId "+assignedlist[0].teacherId);
		//$("#assigned_list").setGridParam({'data': assignedlist});
		jQuery("#student_list").jqGrid('addRowData',1,deletedlist);
		// jQuery("#assigned_list").jqGrid('addRowData',0,{teacherId:"1",teacherName:"1",studentId:"1",studentNumber:"1",studentName:"1",studentGrade:"1",studentDegreeType:"1",studentType:"1",studentPhone1:"111",studentPhone2:"111",studentEmail:"nnn@11.com"},"first");
		//console.log("assigned_list records "+$("#assigned_list").getGridParam("records"));
		//三个列表都取消选择
		$("#student_list").trigger('reloadGrid');
		$("#teacher1_list").trigger('reloadGrid');
		$("#teacher2_list").trigger('reloadGrid');
		$("#teacher3_list").trigger('reloadGrid');
		$("#secretary_list").trigger('reloadGrid');
	};
</script>

<div class="sub_container">
	<div class="list">
	   <h3 class="table_title">待分配学生</h3>
	   <table id="student_list"></table>
    </div>
    <div class="list">
	   <h3 class="table_title">&nbsp;</h3>
	   <table id="teacher1_list"></table>
    </div>
    <div class="list">
	   <h3 class="table_title">&nbsp;</h3>
	   <table id="teacher2_list"></table>
    </div>
    <div class="list">
	   <h3 class="table_title">&nbsp;</h3>
	   <table id="teacher3_list"></table>
    </div>
    <div class="list">
	   <h3 class="table_title">&nbsp;</h3>
	   <table id="secretary_list"></table>
    </div>
    <div class="list" style="margin: 20px 6px 10px 20px">
		<button type="button" onclick="addAssign()"
			style="margin-bottom: 50px; margin-top: 200px"> 添加 >>> </button>
		<br/>
		<button type="button" onclick="delAssign()" 
		    style="margin-bottom: 50px"> 移除 <<<  </button>		
	</div>
    <div id="swing_box" style="margin:0px 0px 0px 0px">
       <div id="swing_button">已分配列表</div>
	   <table id="assigned_list"></table>
	   <div id="toolBar"></div>
    </div>
    
	<input type="file" style="display:none" onchange="upload(this.value)" id="file" name="file" />
</div>