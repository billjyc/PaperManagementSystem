<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="java.io.*,net.sf.json.*"%>
<script  type="text/javascript">
	function submit_result(type, paperId, taskId){
		var detection = (type == 1 ? "true" : "false");
		var resultObj = {
			"paperId" : paperId,
			"taskId" : taskId,
			"detection" : detection
		};
		var resultStr = "paperstr=" + JSON.stringify(resultObj);
		$.ajax({
			type: 'POST',
			url: './deciderepetition.do',
			data: resultStr,
			dataType: 'json',
			beforeSend: function(){
				var win = $.messager.progress({  
	                title:'Please waiting',  
	                msg:'正在处理...',
	                interval: 300
	            });  
			},
			complete: function(){
				$.messager.progress('close');
			},
			success: function(msg) {
				if(msg.result_json == "success"){
					alert("处理完成！");
					jQuery("#list").trigger("reloadGrid");
				}
			},
			error: function() {
				alert("处理失败！");
			}
		});
		/* $.post("./deciderepetition.do", resultStr, function(msg){
			if(msg.result_json == "success"){
				alert("提交成功！");
				jQuery("#list").trigger("reloadGrid");
			}
		},"json"); */
	}
	
	$("#list").jqGrid({	
		url:'checklist.do',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['学号','姓名','论文标题','操作'],		//表格的显示字段
		colModel:[    
        {name:'studentNumber',index:'studentNumber', width:150,align:"center",resizable:false,sorttype:"string"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentName',index:'studentName', width:150,sorttype:"string",resizable:false},    
        {name:'paperTitle',index:'paperTitle',width:400,sortable:false,resizable:false}, 
        {name:'opt',index:'opt',width:260,resizable:false,sortable:false,align:"center"}  
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
		cellEdit:false,	//是否可以编辑表格
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
				approve = "<input style='height:22px;width:60px;margin-right:10px;' type='button' value='批准通过' onclick=\"submit_result(1,"+$("#list").getGridParam('userData')[cl-1].paperId+","+$("#list").getGridParam('userData')[cl-1].taskId+");\"  />"; 
				decline = "<input style='height:22px;width:60px;' type='button' value='驳回修改' onclick=\"submit_result(2," + $("#list").getGridParam('userData')[cl-1].paperId+","+$("#list").getGridParam('userData')[cl-1].taskId+");\"  />"; 		
				$("#list").jqGrid('setRowData',cl,{opt:approve+decline});
		    }
		  }
	    },
		
		onSelectRow: function(id){   
		},
		
		onPaging:function(){
		}
		});
                
      $("#list").jqGrid('navGrid','#datapaper',{edit:false,add:false,del:false});
             
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