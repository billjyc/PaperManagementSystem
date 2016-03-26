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
	         url:"./importClassAssignExcel.do",         
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
			$.post("./assignclass.do",postData,function(msg){
				if(msg.result_json == "success"){
					alert("分配完成！");
					$("#assigned_list").clearGridData();	//分配完成后清空已分配列表
				}
			},"json");
		}else{
			alert("没有分配信息！");
		}
	}
	
	$.post("getclassassignlist.do",{},function(data){
		var assignedlist = [];
	
		$("#student_list").jqGrid({
			data: data.studentlist,	
	     	datatype: 'local',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
	     	colNames:['ID','学号','学生姓名'],		//表格的显示字段
			colModel:[    
			{name:'studentId',index:'studentId',hidden:true},
	        {name:'studentNumber',width:150,resizable:false},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
	        {name:'studentName',width:150,resizable:false}  
	        ] ,
			pgbuttons: false,
    		pgtext: null,
    		rowNum: '9999',
			multiselect: true,
			viewrecords: true,
			height:"400px",   
	     
	     	loadComplete:function(data){ //完成服务器请求后，回调函数
			  if(data.length == 0){
				$("#student_list").append('<tr><td colspan="2">&nbsp;&nbsp;暂无记录！</td></tr>');
			  }
		    },
			
			ondblClickRow : function(id){
				$("#student_list").jqGrid('viewGridRow', id, {closeOnEscape:true} );
			}
		});
		
		$("#class_list").jqGrid({
			data: data.classlist,	
	     	datatype: 'local',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
	     	colNames:['ID','班级编号','班级名称','教学点编号'],		//表格的显示字段
		colModel:[ 
		{name:'id',index:'id',hidden:true}, 
        {name:'no',index:'no', width:150,editable:true,sorttype:"string",resizable:false}, 
        {name:'name',width:150, editable:true,viewable:true,editrules:{edithidden:true}},       
        {name:'teachingPointNo',width:150, editable:true,viewable:true,editrules:{edithidden:true}},  
     	],    
			pgbuttons: false,
    		pgtext: null,
    		rowNum: '9999',
			multiselect: false,
			viewrecords: true,
			height: "400px",  
	     	loadComplete:function(data){ //完成服务器请求后，回调函数
			  if(data.length == 0){
				$("#class_list").append('<tr><td colspan="1">&nbsp;&nbsp;暂无记录！</td></tr>');
			  }
		    },
			
			ondblClickRow : function(id){
				$("#class_list").jqGrid('viewGridRow', id, {closeOnEscape:true} );
			},
			
			onSelectRow : function(rowId){
				students_rows = $("#student_list").getGridParam('selarrrow');
				var classes = $("#class_list").getRowData(rowId);
				
				// 此处必须从student_rows尾部开始取数据，涉及列表删除操作
				for(var i = students_rows.length - 1; i >= 0; i--){
					var student = $("#student_list").getRowData(students_rows[i]);
					student.no= classes['no'];
					student.name = classes['name'];
					student.teachingPointNo=classes['teachingPointNo'];
					assignedlist.push(student);
					$("#student_list").delRowData(students_rows[i]);
				}
				$("#assigned_list").setGridParam({'data': assignedlist});
				$("#student_list").trigger('reloadGrid');
				$("#assigned_list").trigger('reloadGrid');
			}
		});
		
		$("#assigned_list").jqGrid({
			datatype: 'local',
	     	colNames:['studentID','学号','学生姓名','班级编号','班级名称','教学点编号'],		//表格的显示字段
			colModel:[    
			{name:'studentId',hidden:true},
	        {name:'studentNumber',width:150,resizable:false},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
	        {name:'studentName',width:150,resizable:false},    
	        {name:'no',index:'no', width:150,editable:true,sorttype:"string",resizable:false}, 
            {name:'name',width:150, editable:true,viewable:true,editrules:{edithidden:true}},  
            {name:'teachingPointNo',width:150, editable:true,viewable:true,editrules:{edithidden:true}},      
	     	],    
			pgbuttons: false,
    		pgtext: null,
    		rowNum: '9999',
    		pager: '#toolBar',
    	    grouping: true,
		    groupingView: {
	        	groupField: ['name'],
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
	   <h3 class="table_title">待分配学生</h3>
	   <table id="student_list"></table>
    </div>
    <div class="list">
	   <h3 class="table_title">班级</h3>
	   <table id="class_list"></table>
    </div>
    <div class="list">
	   <h3 class="table_title">已分配情况</h3>
	   <table id="assigned_list"></table>
	   <div id="toolBar"></div>
    </div>
    
	<input type="file" style="display:none" onchange="upload(this.value)" id="file" name="file" />
</div>