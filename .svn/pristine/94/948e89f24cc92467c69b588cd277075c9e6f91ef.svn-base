<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<script type="text/javascript">
	$("#list").jqGrid({
		url:'judgeassignedlist.do',
     	datatype: 'json',
     	mtype: 'POST',
     	colNames:['学号','姓名','论文标题','本校评审','外校评审'],	
		colModel:[    
        {name:'studentNumber',index:'studentNumber', width:150,align:"center",resizable:false,sorttype:"string"}, 
        {name:'studentName',index:'studentName', width:150,sorttype:"string",resizable:false},  
        {name:'paperTitle',index:'paperTitle', width:330,sorttype:"string",resizable:false},   
        {name:'innerTeacherName',index:'innerTeacherName',width:150,sortable:false,resizable:false},      
        {name:'outerTeacherName',index:'outerTeacherName',width:150,sortable:false,resizable:false}
     	],    
		rowNum:9999,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
    	pager: '#datapager',	//datapager为显示页码的div
        pgbuttons:false,
        pgtext:null,
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'studentNumber',  
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
     	
     	loadComplete:function(data){ //完成服务器请求后，回调函数
		  if(data.list.length==0){
			$("#list").append('<tr><td colspan="6">&nbsp;&nbsp;暂无学生记录！</td></tr>');
		  }else{
		  
		  }
	    },
		
		onSelectRow: function(id){   
		},
		
		onPaging:function(){
		}
   
		});
                
      $("#list").jqGrid('navGrid','#datapaper',{edit:false,add:false,del:false});
	
</script>

<div class="table_container">
       <div class="title"><h2>已分配评审列表</h2></div>
       <div class="opt"></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
    </div>