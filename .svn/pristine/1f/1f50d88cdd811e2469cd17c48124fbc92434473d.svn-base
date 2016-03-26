<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	Integer accountId = (Integer)request.getSession().getAttribute("accountId");
	Integer teacherId = (Integer)request.getSession().getAttribute("teacherId");
%>
<script  type="text/javascript">
	function submit_result(paperId,taskId){
		var jsonObj = {
			"paperid" : paperId,
			"taskid" : taskId
		};
		var jsonStr = "jsonstr=" + JSON.stringify(jsonObj);
		$.ajax({
			type: 'POST',
			url: './afterreprievedecision.do',
			data: jsonStr,
			dataType: 'json',
			beforeSend: function(){
				var win = $.messager.progress({  
	                title:'Please waiting',  
	                msg:'正在处理中...',
	                interval: 200
	            });  
			},
			complete: function(){
				$.messager.progress('close');
			},
			success: function(msg) {
				if(msg.result_json == "success"){
		            //alert("分配完成！");
					jQuery("#reprieved_list").trigger("reloadGrid");		
				}else{
					alert("处理失败！");
				}
			},
			error: function() {
				alert("处理失败！");
			}
		});
		/* $.post("./afterreprievedecision.do",jsonStr,function(msg){
			if(msg.result_json == "success"){
				alert("accept!");
				jQuery("#reprieved_list").trigger("reloadGrid");
			}
		},"json"); */
		window.setTimeout(function(){
			getMsg(accountId, teacherId);
		}, 1.5*1000);
	}
	
	jQuery("#reprieved_list").jqGrid({	//reprieved_list为页面中需要显示内容的table的id
		url:'./reprievedlist.do',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['学号','姓名','论文标题','论文版本号','操作'],		//表格的显示字段
		colModel:[    
        {name:'studentNumber',index:'studentNumber', width:150,align:"center",resizable:false,sorttype:"string"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentName',index:'studentName', width:150,sorttype:"string",resizable:false},        
        {name:'paperTitle',index:'paperTitle',width:380,resizable:false},          
        {name:'paperVersion',index:'paperVersion', width:100,align:"center",resizable:false},
        {name:'opt',index:'opt',width:180,resizable:false,sortable:false,align:"center"}    
     	],    
		rowNum:10,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
    	rowList:[10,20,30],	//用来改变显示记录数，当选择时会覆盖rowNum参数传递到后台
    	pager: '#datapager',	//datapager为显示页码的div
           
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'studentNumber',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
		viewrecords: true,	//是否显示记录总数
		sortorder: "asc", 
		height:"100%",   
		cellEdit:false,	//是否可以编辑表格
		lastpage:20,	//
		jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
			root: "list",  //包含实际数据的数组
			//page: "currPage",  //当前页
     		//total: "totalPage",//总页数
     		//records:"totalCount", //查询出的记录数
     		userdata : "list",
        	repeatitems : false    
     	},
     	
     	loadComplete:function(data){ //完成服务器请求后，回调函数
     	  //alert("load completed");
		  if(data.list.length==0){ //如果没有记录返回，追加提示信息           
		    //alert(data.list.length);
			$("#reprieved_list").append('<tr><td colspan="5">&nbsp;&nbsp;暂无暂缓通过论文记录！</td></tr>');
		  }else{ //否则，删除提示
			var ids = jQuery("#reprieved_list").jqGrid('getDataIDs');
		    for(var i=0;i < ids.length;i++){
		        var cl = ids[i];
		        var userd=jQuery("#reprieved_list").getGridParam('userData')[cl-1];
		        //alert(JSON.stringify(userd));
				approve = "<input style='height:22px;width:60px;margin-right:10px;' type='button' value='批准通过' onclick=\"submit_result("+userd.paperId+","+userd.taskId+");\"  />"; 
				decline = "<input style='height:22px;width:60px;' type='button' value='驳回修改' onclick=\"\"  />"; 		
				download = "<a title=\"点击下载论文\" onclick=\"downloadPaper("+cl+")\" style='cursor:pointer;'>"+userd.paperTitle+"</a>";
				jQuery("#reprieved_list").jqGrid('setRowData',cl,{opt:approve+decline,paperTitle:download});
								
		    }
			
		  }
	    }
   
		});
                
      jQuery("#reprieved_list").jqGrid('navGrid','#datapaper',{edit:false,add:false,del:false});
      function downloadPaper(cl){
	  	var userd=jQuery("#reprieved_list").getGridParam('userData')[cl-1];
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
 <div class="center">
   <div class="table_container">
       <div class="title"><h2>待暂缓通过后定稿列表</h2></div>
       <div class="opt"></div>
	   <table id="reprieved_list"></table>
	   <div id="datapager"></div>
   </div>
 </div>