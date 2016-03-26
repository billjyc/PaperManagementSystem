<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.io.*,net.sf.json.*"%>

<style>
	.sub_container{padding: 20px 20px;}
</style>

<script type="text/javascript">
	jQuery("#list").jqGrid({	
		url:'tutorassignedlist.do',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['学号','姓名','年级（班级）','联系电话','邮件地址','导师姓名'],		//表格的显示字段
		colModel:[    
        {name:'studentNumber',index:'studentNumber', width:100,align:"center",resizable:false,sorttype:"string"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentName',index:'studentName', width:100,sorttype:"string",resizable:false},    
		{name:'studentGrade',index:'studentGrade', width:100,sorttype:"string",resizable:false},    
        {name:'studentPhone1',index:'studentPhone',width:200,sortable:false,resizable:false},      
        {name:'studentEmail',index:'studentEmail',width:300,sortable:false,resizable:false},     
        {name:'teacherName',index:'teacherName', width:130,sortable:false,resizable:false}      
     	],    
		rowNum:9999,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
		pgbuttons:false,
        pgtext:null,
    	pager: '#datapager',	//datapager为显示页码的div
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'studentNumber',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
		viewrecords: true,	//是否显示记录总数
		sortorder: "asc", 
		height:"400px",   
		jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
			root: "list",  //包含实际数据的数组
			page: "page",  //当前页
     		total: "total_pages",//总页数
     		records:"records", //查询出的记录数
        	repeatitems : false    
     	},
     	
     	loadComplete:function(data){ //完成服务器请求后，回调函数
		  if(data.list.length==0){ //如果没有记录返回，追加提示信息           
			$("#list").append('<tr><td colspan="6">&nbsp;&nbsp;暂无学生记录！</td></tr>');
		  }
	    },
		
		onSelectRow: function(id){   
		},
		
		onPaging:function(){
		}
   
		});
                
      jQuery("#list").jqGrid('navGrid','#datapaper',{edit:false,add:false,del:false});
             
</script>

<div class="sub_container">
	<div class="table_container">
       <div class="title"><h2>已分配导师的学生列表</h2></div>
       <div class="opt"></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
    </div>
</div>