<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<style>
	.list {float:left;margin-left:10px;}
	.table_title{width:100%;text-align:center;color:#526293;font-size:12px;}
</style>

<script>
	var rowID=0;

	function upload(data){
	      $( "#dialog" ).dialog( "open" );
	         var i=0;
            var t = setInterval(function() {
       
        	     $("#progressbar").progressbar("value", i);
        	     i=(i+20)%100;
        	      var name="<%=request.getSession().getAttribute("name")%>"; 
                  $("#result").html("正在导入..."+name);
             }, 300);
              
		$.ajaxFileUpload({
	         url:"./importFeeOfJudgeExcel.do",         
	         secureuri:false,
	         fileElementId:"file", 
	         dataType: "json", 
	         success: function (data, status){
	        clearInterval(t);
	        $("#progressbar").progressbar("value", 100);
	        $("#result").html(data.result);
            $("#list").trigger('reloadGrid');
	         },
	         error: function (data, status, e){      
	        clearInterval(t);
	        $("#progressbar").progressbar("value", 100);
	        $("#result").html(data.result);
	        
            $("#list").trigger('reloadGrid');}
         });};
         
       $(function() {
               $( "#progressbar" ).progressbar({
           value: 37
        });
      });	
    $(function() {
          $( "#dialog" ).dialog({
         autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
  });
             
    function reloadAll() {
    	$("#student_list").trigger('reloadGrid');
		$("#assigned_list").trigger('reloadGrid');
		$("#inner_list").trigger('reloadGrid');
		$("#outer_list").trigger('reloadGrid');
    }
	
	function submit_assign(){
		var data = $("#assigned_list").getRowData();
		if(data != ""){
			var postData = "list=" + JSON.stringify(data)
						  +"&time=2012-11-11 11:11:11";
			$.ajax({
				type: 'POST',
				url: './assignjudge.do',
				data: postData,
				dataType: 'json',
				beforeSend: function(){
					var win = $.messager.progress({  
		                title:'Please waiting',  
		                msg:'正在分配评审中...',
		                interval: 300
		            });  
				},
				complete: function(){
					$.messager.progress('close');
				},
				success: function(msg) {
					//if(msg.result_json == "success"){
						if(msg.result_json == "success"){
							alert("分配完成！");
						} else {
							var conflict_list = msg.conflict_list;
							//如果分配的评审老师为学生自己的导师，所有分配结果失效
							if(conflict_list.length > 0) {
								var msg = "分配评审失败，学号为";
								$.each(conflict_list, function(n, value) {
									msg += value.studentNumber;
									msg += ",";
								});
								msg += "的学生分配的评审与自己的导师重复！";
								alert(msg);
							}
							//重新加载学生列表
							$.ajax({
								type: 'POST',
								url: "assignjudgelist.do",
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
					//}else{
						//alert("分配失败！");
					//}
				},
				error: function() {
					alert("分配评审失败！");
				}
			});
			/* $.post("./assignjudge.do",postData,function(msg){
				alert("正在分配，稍安勿躁...");
				if(msg.result_json == "success"){
					alert("分配完成！");
				} else {
					var conflict_list = msg.conflict_list;
					//如果分配的评审老师为学生自己的导师，所有分配结果失效
					if(conflict_list.length > 0) {
						var msg = "分配评审失败，学号为";
						$.each(conflict_list, function(n, value) {
							msg += value.studentNumber;
							msg += ",";
						});
						msg += "的学生分配的评审与自己的导师重复！";
						alert(msg);
					}
					//重新加载学生列表
					$.ajax({
						type: 'POST',
						url: "assignjudgelist.do",
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
	
	$.post("assignjudgelist.do",{},function(data){
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
			viewrecords: true,
			height:"400px",  
			width : 250, 
	     
	     	loadComplete:function(data){ //完成服务器请求后，回调函数
			  if(data.length == 0){
				$("#student_list").append('<tr><td colspan="2">&nbsp;&nbsp;暂无记录！</td></tr>');
			  }
		    },
			
			ondblClickRow : function(id){
				$("#student_list").jqGrid('viewGridRow', id, {closeOnEscape:true} );
			}
		});
		
		$("#inner_list").jqGrid({
			data: data.innerlist,	
	     	datatype: 'local',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
	     	colNames:['ID','编号','本校教师','类别','学历','职称','联系电话','邮件地址'],		//表格的显示字段
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
			width : 150,
	     
	     	loadComplete:function(data){ 
			  if(data.length == 0){
				$("#inner_list").append('<tr><td colspan="1">&nbsp;&nbsp;暂无记录！</td></tr>');
			  }
		    },
			
			ondblClickRow : function(id){
				$("#inner_list").jqGrid('viewGridRow', id, {closeOnEscape:true});
			}
		});
		
		$("#outer_list").jqGrid({
			data: data.outerlist,	
	     	datatype: 'local',    
	     	colNames:['ID','编号','外校教师','类别','学历','职称','联系电话','邮件地址'],	
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
			width : 150,
	     
	     	loadComplete:function(data){ //完成服务器请求后，回调函数
			  if(data.length == 0){
				$("#outer_list").append('<tr><td colspan="1">&nbsp;&nbsp;暂无记录！</td></tr>');
			  }
		    },
			
			ondblClickRow : function(id){
				$("#outer_list").jqGrid('viewGridRow', id, {closeOnEscape:true} );
			},
			
			onSelectRow : function(rowId){
				rowID = rowId;
			}
		});
			
		 //创建一个input输入框 
            function myelem (value, options) { 
              var el = document.createElement("input"); 
              el.type="text"; 
              el.value = value; 
              return el; 
            } 
             
            //获取值 
            function myvalue(elem) { 
              return $(elem).val(); 
            } 
		
		$("#assigned_list").jqGrid({
			datatype: 'local',
	     	colNames:['innerID','outerID','评审老师','学生ID','学号','学生姓名','年级','攻读学位','类型','联系电话','备用电话','邮件地址','截止日期'],		//表格的显示字段
			colModel:[    
			{name:'innerId',hidden:true},
			{name:'outerId',hidden:true},
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
	        {name:'deadline',width:130,resizable:false,sortable:false,
	        editable:true,edittype:'custom',editoptions:{custom_element: myelem, custom_value:myvalue}
	        	//formatter: function(cellvalue, options, rowObject) {
                //	return  "<input type='text' style='border:none;background-color: transparent;text-align:center' value='未设置' readonly class='date'/>";
          		//}
    		}],
    		
    		
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
	    		$(".date").datepicker();
	    	},
			multiselect: false,
			height: "400px",  
			width : 400, 
			ondblClickRow : function(id){
				$("#assigned_list").jqGrid('viewGridRow', id, {closeOnEscape:true} );			
			}
		});
		
		
		 function getRow() {
	    var id = $("#assigned_list").jqGrid('getGridParam', 'selrow');
	  
	    alert("当前选中行ID：" + id);
	};
	
	function  getDeadline() {
	    var  rowid = $("#assigned_list").getGridParam("selrow");
		var  rowData = $("#assigned_list").getRowData(rowid);   
	    alert("123"+myvalue(rowData));
	   //alert("截止日期");
	};
		
			
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
		
		.navSeparatorAdd("#toolBar",{
			sepclass : "ui-separator",
			sepcontent: ''
		})
		
		.navSeparatorAdd("#toolBar",{
			sepclass : "ui-separator",
			sepcontent: ''
		})
		
		.navSeparatorAdd("#toolBar",{
			sepclass : "ui-separator",
			sepcontent: ''
		})
		
		.navButtonAdd("#toolBar",{
		   caption:"输出截止日期", 
		   buttonicon:"ui-icon-plus", 
		   onClickButton: function(){ 
		  	 getDeadline();
		   }
		})
		
		.navSeparatorAdd("#toolBar",{
			sepclass : "ui-separator",
			sepcontent: ''
		})
		
		.navSeparatorAdd("#toolBar",{
			sepclass : "ui-separator",
			sepcontent: ''
		})
		
		.navSeparatorAdd("#toolBar",{
			sepclass : "ui-separator",
			sepcontent: ''
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
		
	},"json");
	
	function addAssign(){
		var assignedlist = [];
		innerRow = $("#inner_list").getGridParam('selrow');
		if(innerRow!=null){
			innerTeacher = $("#inner_list").getRowData(innerRow);
			outerTeacher = $("#outer_list").getRowData(rowID);
			students_rows = $("#student_list").getGridParam('selarrrow');
			
			// 此处必须从student_rows尾部开始取数据，涉及列表删除操作
			for(var i = students_rows.length - 1; i >= 0; i--){
				var student = $("#student_list").getRowData(students_rows[i]);
				student.innerId = innerTeacher['teacherId'];
				student.outerId = outerTeacher['teacherId'];
				student.teacherName = "内审 : " + innerTeacher['teacherName'] + " 外审 : "+outerTeacher['teacherName'];
				if( (typeof(student.innerId) != "undefined") && (typeof(student.outerId) != "undefined") ){
				    assignedlist.push(student);
				    $("#student_list").delRowData(students_rows[i]);
				}
			}
			jQuery("#assigned_list").jqGrid('addRowData',1,assignedlist);
			// $("#assigned_list").setGridParam({'data': assignedlist});
			reloadAll();
		}
	}
	
	function delAssign(){
		var deletedlist = [];
	  	delete_row = jQuery("#assigned_list").getGridParam('selrow');
		 
		// 此处必须从assigned_list尾部开始取数据，涉及列表删除操作
		var delAssign = $("#assigned_list").getRowData(delete_row);
		//console.log("delete_row "+delete_row);
		//console.log("deletedlist.length "+deletedlist.length);
		if(delete_row != null){
		deletedlist.push(delAssign);
		}
		//console.log("deletedlist.length "+deletedlist.length);
		$("#assigned_list").delRowData(delete_row);
		
		//console.log("assignedlist[0] teacherId "+assignedlist[0].teacherId);
		//$("#assigned_list").setGridParam({'data': assignedlist});
		jQuery("#student_list").jqGrid('addRowData',1,deletedlist);
		// jQuery("#assigned_list").jqGrid('addRowData',0,{teacherId:"1",teacherName:"1",studentId:"1",studentNumber:"1",studentName:"1",studentGrade:"1",studentDegreeType:"1",studentType:"1",studentPhone1:"111",studentPhone2:"111",studentEmail:"nnn@11.com"},"first");
		//console.log("assigned_list records "+$("#assigned_list").getGridParam("records"));
		//三个列表都取消选择
		$("#student_list").trigger('reloadGrid');
		$("#assigned_list").trigger('reloadGrid');
		$("#inner_list").trigger('reloadGrid');
		$("#outer_list").trigger('reloadGrid');
	};
</script>

<div class="sub_container">
<input type="file" style="display:none" id="file" name="file"  onchange="upload(this.value);"   />
	<div class="list">
	   <h3 class="table_title">待分配学生</h3>
	   <table id="student_list"></table>
    </div>
    <div class="list">
	   <h3 class="table_title">&nbsp;</h3>
	   <table id="inner_list"></table>
    </div>
    <div class="list">
	   <h3 class="table_title">&nbsp;</h3>
	   <table id="outer_list"></table>
    </div>
    <div class="list" style="margin: 20px 6px 10px 20px">
		<button type="button" onclick="addAssign()"
			style="margin-bottom: 50px; margin-top: 200px"> 添加 >>> </button>
		<br/>
		<button type="button" onclick="delAssign()" 
		    style="margin-bottom: 50px"> 移除 <<<  </button>		
	</div>
    <div class="list">
	   <h3 class="table_title">已分配情况</h3>
	   <table id="assigned_list"></table>
	   <div id="toolBar"></div>
    </div>
</div>