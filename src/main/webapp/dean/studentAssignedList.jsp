<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<style>
	.sub_container{padding: 20px 20px;}
</style>
<script type="text/javascript">
	jQuery("#list").jqGrid({	
		url:'studentassignedlist.do',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['学号','学生姓名','课程编号','课程名称'],		//表格的显示字段
		colModel:[    
        {name:'studentNo',index:'studentNo', width:100,align:"center",resizable:false,sorttype:"string"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentName',index:'studentName', width:100,sorttype:"string",resizable:false},    
		{name:'courseNo',index:'courseNo', width:100,sorttype:"string",resizable:false},    
        {name:'courseName',index:'courseName',width:200,sortable:false,resizable:false},         
     	],    
		rowNum:9999,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
    	pager: '#datapager',	//datapager为显示页码的div
        pgbuttons:false,
        pgtext:null,
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'studentNo',  
		viewrecords: true,	//是否显示记录总数
		sortorder: "asc", 
		height:"100%",   
		cellEdit:false,	
		lastpage:20,
		jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
			root: "list",  //包含实际数据的数组
			page: "page",  //当前页
     		total: "total_pages",//总页数
     		records:"records", //查询出的记录数
        	repeatitems : false    
     	},
     	grouping: true,
	    groupingView: {
        	groupField: ['studentNo'],
        	groupText : ['<strong>{0}</strong>'],
        	groupColumnShow: true
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
       <div class="title"><h2>已分配课程列表</h2></div>
       <div class="opt"></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
    </div>
</div>