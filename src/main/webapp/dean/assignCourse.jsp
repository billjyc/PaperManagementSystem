<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<style>
	.list {float:left;margin-left:40px;}
	.table_title{width:100%;text-align:center;color:#526293;font-size:12px;}
</style>

<script>
	function upload(data){
	      $( "#dialog" ).dialog( "open" );
	         var i=0;
            var t = setInterval(function() {
       
        	     $("#progressbar").progressbar("value", i);
        	     i=(i+20)%100;
             }, 300);
             
             $("#result").html("正在导入");
		$.ajaxFileUpload({
	         url:"./importStudentCourseInfoExcel.do",         
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
	
	function submit_assign(){
		var data = $("#assigned_list").getRowData();	//获取已分配列表中数据
		if(data != ""){
			var postData = "list=" + JSON.stringify(data);	
			//将数组post至后台assignteacher.do请求
			$.post("./assigncourse.do",postData,function(msg){
				alert("正在分配，稍安勿躁...");
				if(msg.result_json == "success"){
					alert("分配完成！");
					$("#assigned_list").clearGridData();	//分配完成后清空已分配列表
				}
			},"json");
		}else{
			alert("没有分配信息！");
		}
	}
	
	$.post("getCourseAssignList.do",{},function(data){
		var assignedlist = [];
	
		$("#course_list").jqGrid({
			data: data.courselist,	
	     	datatype: 'local',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside

	     	colNames:['ID','课程号','课程名','教师','学年'],		//表格的显示字段
		colModel:[ 
		{name:'courseId',index:'courseId',hidden:true},   
        {name:'courseNo',index:'courseNo', width:50,editable:true,sorttype:"string",editoptions:{size:15}},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'courseName',index:'courseName', width:50,editable:true,sorttype:"string"},        
        
        {name:'teacherName',index:'teacherName',width:50,sorttype:"string",editable:true},      
        {name:'date',index:'date',width:50,editable:true},
     	],   

			pgbuttons: false,
			   shrinkToFit: true,
    		pgtext: null,
    		rowNum: '9999',
			multiselect: true,
			viewrecords: true,
			height:"400px",   
	     
	     	loadComplete:function(data){ //完成服务器请求后，回调函数
			  if(data.length == 0){
				$("course_list").append('<tr><td colspan="2">&nbsp;&nbsp;暂无记录！</td></tr>');
			  }
		    },
			
			ondblClickRow : function(id){
				$("#course_list").jqGrid('viewGridRow', id, {closeOnEscape:true} );
			}
		});
		
		
		$("#student_list").jqGrid({
			data: data.studentlist,	
	     	datatype: 'local',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
	     	colNames:['ID','学号','学生姓名','年级','攻读学位','类型','联系电话','备用电话','邮件地址'],		//表格的显示字段
			colModel:[    
			{name:'studentId',index:'studentId',hidden:true},
	        {name:'studentNumber',width:100,resizable:false},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
	        {name:'studentName',width:100,resizable:false},    
	        {name:'studentGrade',hidden:true,viewable:true,editrules:{edithidden:true}},
			{name:'studentDegreeType',hidden:true,viewable:true,editrules:{edithidden:true}},
		    {name:'studentType',hidden:true,viewable:true,editrules:{edithidden:true}},
	        {name:'studentPhone1',hidden:true,viewable:true,editrules:{edithidden:true}},      
	        {name:'studentPhone2',hidden:true,viewable:true,editrules:{edithidden:true}},      
	        {name:'studentEmail',hidden:true,viewable:true,editrules:{edithidden:true}}
	     	],    
			pgbuttons: false,
    		pgtext: null,
    		rowNum: '9999',
			multiselect: false,
			viewrecords: true,
			height: "400px",  
	     	loadComplete:function(data){ //完成服务器请求后，回调函数
			  if(data.length == 0){
				$("#student_list").append('<tr><td colspan="1">&nbsp;&nbsp;暂无记录！</td></tr>');
			  }
		    },
			
			ondblClickRow : function(id){
				$("#student_list").jqGrid('viewGridRow', id, {closeOnEscape:true} );
			},
			
			onSelectRow : function(rowId){
				courses_rows = $("#course_list").getGridParam('selarrrow');
				var student = $("#student_list").getRowData(rowId);
				
				
				for(var i = courses_rows.length - 1; i >= 0; i--){
					var course = $("#course_list").getRowData(courses_rows[i]);

			        
				
					var studentCourseInfo =$("#studentCourseInfo_list").getRowData(0);
				
					studentCourseInfo.studentNumber= student['studentNumber'];
					studentCourseInfo.studentName = student['studentName'];
					
					studentCourseInfo.courseName=course['courseName'];
							studentCourseInfo.courseNo=course['courseNo'];
							studentCourseInfo.date=course['date'];
					
					assignedlist.push(studentCourseInfo);

				}
				$("#assigned_list").setGridParam({'data': assignedlist});
				$("#course_list").trigger('reloadGrid');
				$("#assigned_list").trigger('reloadGrid');
			}
		});
		
		$("#assigned_list").jqGrid({
			datatype: 'local',

	     	colNames:['学生ID','学生学号','学生姓名','课程编号','课程名称','开课日期','授课教师编号'],		//表格的显示字段

			colModel:[    

			{name:'studnetId',hidden:true},
			{name:'studentNumber',hidden:true},
			{name:'studentName'},


	        {name:'courseNo',width:100,resizable:false},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
	        {name:'courseName',width:100,resizable:false},    
	        {name:'date',hidden:true},    
	        {name:'teacherId',hidden:true,viewable:true,editrules:{edithidden:true}}
	     	],    
			pgbuttons: false,
    		pgtext: null,
    		rowNum: '9999',
    		pager: '#toolBar',
    	    grouping: true,
		    groupingView: {
	        	groupField: ['studentName'],
	        	groupColumnShow: false
	    	},
			multiselect: false,
			height: "400px",   
			ondblClickRow : function(id){
				$("#assigned_list").jqGrid('viewGridRow', id, {closeOnEscape:true} );
			}
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
		   buttonicon:"ui-icon-add", 
		   onClickButton: function(){ 
		  	 submit_assign();
		   }	   
		});
		
	},"json");
</script>

<div class="sub_container">
<div id="dialog" title="导入数据">
  <div id="progressbar" ></div>
  <div id="result" style="color:red; font-size:18px;"></div>
  </div>
	<div class="list">
	   <h3 class="table_title">待选课程</h3>
	   <table id="course_list"></table>
    </div>
    <div class="list">
	   <h3 class="table_title">本校学生</h3>
	   <table id="student_list"></table>
    </div>
    <div class="list">
	   <h3 class="table_title">分配情况</h3>
	   <table id="assigned_list"></table>
	   <div id="toolBar"></div>
    </div>
    
	<input type="file" style="display:none" onchange="upload(this.value)" id="file" name="file" />
</div>