<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script  type="text/javascript">
	
	function submitResult(isPassed,interimId,taskId){
		// isPassed : 1 通过，0不通过
		var jsonObj = {
			"interimReportId" : interimId,
			"taskId": taskId,
			"result" : isPassed
		};
		var jsonStr = "jsonstr=" + JSON.stringify(jsonObj);
		$.ajax({
			type: 'POST',
			url: './judgeinterim.do',
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
					$("#list").trigger("reloadGrid");		
				}else{
					alert("处理失败！");
				}
			},
			error: function() {
				alert("处理失败！");
			}
		});
		/* $.post("./judgeinterim.do",jsonStr,function(msg){
			if(msg.result_json != "success")
				alert("操作失败！");
			$("#list").trigger("reloadGrid");
		},"json"); */
		window.setTimeout(function(){
			getMsg(accountId, teacherId);
		}, 1.5*1000);
	}

	$("#list").jqGrid({	
		url:'getuncheckedinterim.do',
     	datatype: 'json',
     	mtype: 'POST',
     	colNames:['学号','姓名','中期检查','操作'],
		colModel:[    
        {name:'studentNumber',index:'studentNumber', width:150,resizable:false,sorttype:"string"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentName',width:150,resizable:false,sortable:false},        
        {name:'interimReportAddress',width:380,resizable:false,sortable:false,
        	formatter: function(cellvalue, options, rowObject) {
                return  "<a href='..\\" + cellvalue + "'>下载文件</a>";
            }},          
        {name:'opt',index:'opt',width:180,resizable:false,sortable:false}    
     	],    
    	pager: '#datapager',	
    	pgbuttons : false,
    	pgtext : null,
		multiselect: false,	
		sortname: 'studentNumber',
		viewrecords: true,
		sortorder: "desc", 
		height:"100%",   
		width : 900,
		cellEdit:false,	
		jsonReader: { 
			root: "list",
     		userdata : "list",
        	repeatitems : false    
     	},
     	
     	loadComplete:function(data){
		  if(data.list.length==0){   
			$("#list").append('<tr><td colspan="5">&nbsp;&nbsp;暂无记录！</td></tr>');
		  }else{ 
			var ids = $("#list").jqGrid('getDataIDs');
		    for(var i=0;i < ids.length;i++){
		        var cl = ids[i];
				approve = "<input style='height:22px;width:60px;margin-right:10px;' type='button' value='批准通过' onclick=\"submitResult(1,"+$("#list").getGridParam('userData')[cl-1].interimReportId+","+$("#list").getGridParam('userData')[cl-1].taskId+");\"  />"; 
				decline = "<input style='height:22px;width:60px;' type='button' value='驳回修改' onclick=\"submitResult(0,"+$("#list").getGridParam('userData')[cl-1].interimReportId+","+$("#list").getGridParam('userData')[cl-1].taskId+");\"  />"; 		
				$("#list").jqGrid('setRowData',cl,{opt:approve+decline});
		    }
			
		  }
	    }
		});
                
      $("#list").navGrid('#datapaper',{edit:false,add:false,del:false});
</script>

<div class="sub_container">
	<div class="table_container">
       <div class="title"><h2>待审中期检查</h2></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
	</div>   
</div>