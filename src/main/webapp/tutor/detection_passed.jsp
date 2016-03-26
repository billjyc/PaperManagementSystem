<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.io.*,net.sf.json.*"%>
<script  type="text/javascript">
	
	$("#list").jqGrid({	
		url:'getdetectionpassed.do',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['学号','姓名','论文标题','重复率'],		//表格的显示字段
		colModel:[    
        {name:'studentNumber',index:'studentNumber', width:150,align:"center",resizable:false,sorttype:"string"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentName',index:'studentName', width:150,sorttype:"string",resizable:false},    
        {name:'paperTitle',index:'paperTitle',width:400,sortable:false,resizable:false}, 
        {name:'repetitionRate',index:'repetitionRate',width:260,resizable:false,sortable:false,align:"center"}  
     	],    
		rowNum:5,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
    	rowList:[5,10,15],	//用来改变显示记录数，当选择时会覆盖rowNum参数传递到后台
    	pager: '#datapager',	//datapager为显示页码的div
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'studentNumber',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
		viewrecords: true,	//是否显示记录总数
		sortorder: "asc", 
		height:"100%",   
		cellEdit:false,	//是否可以编辑表格
		lastpage:20,	//
		jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
			root: "list",
			userdata: "list",  //包含实际数据的数组
			page: "page",  //当前页
     		total: "total_pages",//总页数
     		records:"records", //查询出的记录数
        	repeatitems : false    
     	},
     	
     	loadComplete:function(data){
		  if(data.list.length == 0){
			$("#list").append('<tr><td colspan="4">&nbsp;&nbsp;暂无记录！</td></tr>');
		  }else{
			var ids = $("#list").jqGrid('getDataIDs');
		    for(var i=0;i < ids.length;i++){
		        var cl = ids[i];
		        var cl = jQuery("#list").getGridParam('userData')[cl-1];
				approve = "<input style='height:22px;width:60px;margin-right:10px;' type='button' value='批准通过' onclick=\"submit_result(1,"+userd.paperId+","+userd.taskId+");\"  />"; 
				decline = "<input style='height:22px;width:60px;' type='button' value='驳回修改' onclick=\"submit_result(2," + userd.paperId+","+userd.taskId+");\"  />"; 		
				jQuery("#list").jqGrid('setRowData',cl,{opt:approve+decline});
				download = "<a title=\"点击下载论文\"  onclick=\"downloadPaper("+cl+")\" style='cursor:pointer;'>"+userd.paperTitle+"</a>"; 		
				jQuery("#list").jqGrid('setRowData',cl,{paperTitle:download});
		    }
		  }
	    },
		
		onSelectRow: function(id){   
		},
		
		onPaging:function(){
		}
		});
                
      jQuery("#list").jqGrid('navGrid','#datapaper',{edit:false,add:false,del:false});
      function downloadPaper(cl){
	  	var userd=jQuery("#list").getGridParam('userData')[cl-1];
	  	var path = userd.paperAddress;
	  	var url = "./downloadpaper.do";
		var method='post';
		jQuery(
				'<form action="' + url + '" method="' + (method || 'post')
						+ '"><input name="path" type="hidden" value="'+path+'" /></form>')
		.appendTo('body').submit()
		.remove();
	  }    
</script>

<style>
	.sub_container{padding: 20px 20px;}
</style>

<script type="text/javascript">

</script>

<div class="sub_container">
	<div class="table_container">
       <div class="title"><h2>待检论文列表</h2></div>
       <div class="opt"></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
    </div>
</div>
