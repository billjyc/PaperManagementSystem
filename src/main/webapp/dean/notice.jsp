<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
 <head>
		<title>添加公告页面</title>
		<meta http-equiv="content-type" content="text/html;charset=utf-8" />
		
		<link rel="stylesheet" href="../css/global.css" type="text/css" />
		<link rel="stylesheet" type="text/css" media="screen" href="../css/jquery-ui-custom.css" />
		<link rel="stylesheet" type="text/css" media="screen" href="../css/ui.jqgrid.css" />
		
		<script src="../js/jquery-1.9.0.min.js" type="text/javascript"></script>
		<script src="../js/ajaxfileupload.js" type="text/javascript"></script>
		<script type="text/javascript" src="../js/grid.locale-cn.js"></script> 
		<script type="text/javascript" src="../js/jquery.jqGrid.min.js"></script> 
		<script type="text/javascript" src="../js/jquery.jqGrid.src.js"></script> 
	    <script src="../js/jquery-ui-custom.min.js" type="text/javascript"></script> 
 <style>
		.ui-jqgrid tr.jqgrow td {
			white-space: normal !important;
			height:auto;
			}
</style>

 </head>
  
 <body>
  <%@ include file="../header.jsp"%>	
  <div class="body_container">
    <div style="margin:30px auto; width:1000px">
    
    <script type="text/javascript">
    $(document).ready(function(){
        $("#notice_list").jqGrid({	//页面中需要显示内容的table的id
	     	url: "getnotice.do",    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
			datatype: 'json',
	     	mtype: 'POST',
	     	colNames:['序号','主题','时间','优先级'],		//表格的显示字段
			colModel:[    
	        {name:'noticeId',hidden:true},  //表格总宽 930
	        {name:'noticeTheme',index:'noticeTheme', width:500,sorttype:"string",resizable:false,editable:true},    
	        {name:'noticeTime',index:'noticeTime',width:300,sortable:"date",resizable:false},      
	        {name:'noticeLevel',index:'noticeLevel',width:130,sortable:"int",editable:true,resizable:false,formatter:"select",edittype:"select",editoptions:{value:{1:'重要',2:'一般'}},cellattr: addCellAttr}
	     	],    
			rowNum:9999,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
	    	pager: '#datapager',	//datapager为显示页码的div
	        pgbuttons: false,
	    	pgtext: null,
	    	scrollrows: true,
			multiselect: true,	//是否可多选，多选的话前面有多选框    
			sortname: 'noticeTime',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
			viewrecords: true,
			sortorder: "asc", 
			editurl: 'editnotice.do',
			height:"370px",   
			width:"900px",
			caption: "公告列表",	//表格名称
			jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
				root: "list",  //包含实际数据的数组
	     		records:"records",
	     		userdata : "list",
	        	repeatitems : false    
	     	},
	     	loadComplete:function(data){ //完成服务器请求后，回调函数
			  if(data.list.length==0){
				$("#notice").append('<tr><td colspan="6">&nbsp;&nbsp;暂无学生记录！</td></tr>');
			  }else{
			  }
		    },
	        subGrid : true,
			subGridRowExpanded: function (subgridDivId, rowId) {
				var record=new Array();
				record[0]=jQuery("#notice_list").getGridParam('userData')[rowId-1];
	        	var subgridTableId = subgridDivId + "_t";
	        	$("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
	       	 	$("#" + subgridTableId).jqGrid({ 
		            datatype: 'local',
		            data: record,
		            colNames: ['内容'],
		            colModel: [
		                { name: 'noticeContent', width:1000,resizable:false,editable:true,edittype:"textarea", editoptions:{rows: "10",cols: "50"},sortable:false,cellattr: addCellAttr}    
		            ],      
		            onSelectRow: function(id){
						jQuery("#"+subgridTableId).editGridRow(id,
						{width:'auto',
						height:'auto',
						closeAfterEdit:true,
						afterComplete:function(response, data, formid){
							jQuery("#"+subgridTableId).setRowData(id,{noticeContent:data.noticeContent});
						}});
					},    
					editurl: "editnoticecontent.do?noticeId=" + record[0].noticeId,
		            height:150
	            });
	           }	
			});
			
			function addCellAttr(rowId, val, rawObject, cm, rdata) {
				 if (val=='重要') {
				                    return "style='color:red;font-weight:bold;'";
				                }
				 if(cm.name=='noticeContent'){return "style='height:150px;text-align:left;padding:5 15;'";}
			}
		    
		    jQuery("#notice_list").navGrid("#datapager", 
		   		{
			        edit : true,
			        add : true,
			        del : true,
			        view : false,
			        search : false
		    	}, 
		    	 //edit
		        {
		        	addCaption: "添加记录",  
		    		editCaption: "修改记录",  
		     		bSubmit: "提交",  
		    		bCancel: "取消",  
		    		bClose: "关闭",  
		     		reloadAfterSubmit:true,
		     		closeAfterEdit:true,
		     		serializeEditData: function (postdata) {
		      			var rowdata = $("#notice_list").getRowData(postdata.id);
		      			postdata.noticeId = rowdata.noticeId;
				      	return postdata;
		 			}
		        },
		        //add
		        {
		        	height:280,
		        	reloadAfterSubmit:true,
		        	closeAfterAdd:true
		        },
		        //del
		        {
		        	reloadAfterSubmit:true,
		        	closeAfterDel:true,
		        	serializeDelData: function (postdata) {
		      			rows = $("#notice_list").getGridParam('selarrrow');
		      			var idrows = [];
		      			for(var i = 0; i < rows.length; i++){
							var notice = $("#notice_list").getRowData(rows[i]);
							idrows.push(notice['noticeId']);
						}
		      			rows_json = JSON.stringify(idrows);
				      	return {noticeIds: rows_json, oper: postdata.oper};
		 			}
		        },
		        //search
		        {
		            caption : "查找",
		            Find : "开始查找",
		            closeAfterSearch : true,
		            odata : ['equal', 'not equal']
		        },   
		        //view 
		        {
		        	caption: "查看信息",  
		   			bClose: "关闭"
		        });
    });
    </script>
    
      <table id="notice_list"></table>
	  <div id="datapager"></div>
    </div>

  </div>
 </body>
</html>
