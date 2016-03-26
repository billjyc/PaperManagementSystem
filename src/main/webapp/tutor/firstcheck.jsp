<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	Integer accountId = (Integer)request.getSession().getAttribute("accountId");
	Integer teacherId = (Integer)request.getSession().getAttribute("teacherId");
%>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script  type="text/javascript">
	//通过，待修改
	function showEditarea(type,paperId,taskId){
		if(type==1){
			//通过
			$("#pass_area").show();
		}else if(type==2){
			//未通过
			$("#bemodify_area").show();
		}
		$("#taskId").attr("value",taskId);
		$("#paperId").attr("value",paperId);
	}
	function hideEditarea(type){
		if(type==1){
			//通过
			$("#pass_area").hide();
		}else if(type==2){
			//未通过
			$("#bemodify_area").hide();
		}
	}
	//通过，提交导师意见；
	function submit_pass(){
	      var yjbObj = {
			"paper_id" : $("#paperId").val(),
			"filename" : "submit_views",
			"task_id" : $("#taskId").val(),
			"result" : "FIRST_DRAFT_FINALIZED" ,
			"addtion":  $("#addtion").val()
		      };
			$.ajaxFileUpload({
			url : "./judgefirstcheck.do",
			secureuri : false,
			fileElementId : "submit_views",
			dataType : "json",
			data :yjbObj,
			success : function(data, status)
			{
				$("#pass_area").hide();
				alert("提交成功!");
				jQuery("#firstcheck_list").trigger("reloadGrid");
				getMsg(accountId, teacherId);
			},
			error : function(data, status, e)
			{
			}
		});
		
	}
	//不通过，提交批注
	function submit_reject(){
	   var yjbObj = {
			"paper_id" : $("#paperId").val(),
			"filename" : "submit_views",
			"task_id" : $("#taskId").val(),
			"result" : "rejected" ,
			"addtion":  $("#addtion").val()
		};
			$.ajaxFileUpload({
			url : "./judgefirstcheck.do",
			secureuri : false,
			fileElementId : "submit_views",
			dataType : "json",
			data :yjbObj,
			success : function(data, status)
			{
				$("#bemodify_area").hide();
				alert("提交成功!");
				jQuery("#firstcheck_list").trigger("reloadGrid");
				getMsg(accountId, teacherId);
			},
			error : function(data, status, e)
			{
			}
		});
	
	}
	//初稿审核通过
	/* function pass_firstcheck(){
		var yjbObj = {
			"paper_id" : $("#paperId").val(),
			"filename" : "submit_views",
			"task_id" : $("#taskId").val(),
			"result" : "first finalized" ,
			"addtion":  $("#addtion").val()
		};
		var yjbStr = "yjbstr=" + JSON.stringify(yjbObj);
		
		
		$.post("./judgefirstcheck.do",yjbStr,function(data){
			$("#pass_area").hide();
			alert("提交成功!");
			jQuery("#firstcheck_list").trigger("reloadGrid");
		});
		
		window.setTimeout(function(){
			getMsg(accountId, teacherId);
		}, 1.5*1000);
	}
	//初稿审核未通过
	function reject_firstcheck(){
		var yjbObj = {
			"paper_id" : $("#paperId").val(),
			"filename" : "submit_views",
			"task_id" : $("#taskId").val(),
			"result" : "rejected" ,
			"addtion":  $("#addtion").val()
		};
		var yjbStr = "yjbstr=" + JSON.stringify(yjbObj);
		$.post("./judgefirstcheck.do",yjbStr,function(data){
			$("#bemodify_area").hide();
			alert("提交成功!");
			jQuery("#firstcheck_list").trigger("reloadGrid");
		});
		
	
	} */

	jQuery("#firstcheck_list").jqGrid({	//firstcheck_list为页面中需要显示内容的table的id
		url:'getfirstcheck.do',	//生成json数据的url源
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
		sortorder: "desc", 
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
     	
     	subGrid : true,
		subGridRowExpanded: function (subgridDivId, rowId) {
        var subgridTableId = subgridDivId + "_t";
        $("#" + subgridDivId).html("<table id='" + subgridTableId + "'></table>");
        var data=new Array();
        data[0]= jQuery("#firstcheck_list").getGridParam('userData')[rowId-1];
        //alert(JSON.stringify(data));
        $("#" + subgridTableId).jqGrid({ 
            datatype: 'local',
            data: data,
            colNames: ['附言:'],
            colModel: [
                { name: 'paperAffix1', width:975,resizable:false,sortable:false}       
            ],            
            height:"100%"
            });
        },
            
     	loadComplete:function(data){ //完成服务器请求后，回调函数
     	  //alert("load completed");
		  if(data.list.length==0){ //如果没有记录返回，追加提示信息           
		    //alert(data.list.length);
			$("#firstcheck_list").append('<tr><td colspan="5">&nbsp;&nbsp;暂无初稿记录！</td></tr>');
		  }else{ //
			var ids = jQuery("#firstcheck_list").jqGrid('getDataIDs');
		    for(var i=0;i < ids.length;i++){
		        var cl = ids[i];
		        var userd = jQuery("#firstcheck_list").getGridParam('userData')[cl-1];
				approve = "<input style='height:22px;width:60px;margin-right:10px;' type='button' value='批准通过' onclick=\"showEditarea(1,"+userd.paperId+","+userd.taskId+");\"  />"; 
				decline = "<input style='height:22px;width:60px;' type='button' value='驳回修改' onclick=\"showEditarea(2,"+userd.paperId+","+userd.taskId+");\"  />"; 		
				jQuery("#firstcheck_list").jqGrid('setRowData',cl,{opt:approve+decline});
				download = "<a title=\"点击下载论文\" onclick=\"downloadPaper("+cl+")\" style='cursor:pointer;'>"+userd.paperTitle+"</a>"; 		
				jQuery("#firstcheck_list").jqGrid('setRowData',cl,{paperTitle:download});
		    }
			
		  }
	    },
	    
		
		onSelectRow: function(id){   
			//alert("第"+id+"行被选中");  
		},
		
		onPaging:function(){
			//alert("翻页键被按下");
		}
   
		});
                
      jQuery("#firstcheck_list").navGrid('#datapaper',{edit:false,add:false,del:false});
	  function downloadPaper(cl){
	  	var userd=jQuery("#firstcheck_list").getGridParam('userData')[cl-1];
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
       <div class="title"><h2>完成初稿列表</h2></div>
       <div class="opt"></div>
	   <table id="firstcheck_list"></table>
	   <div id="datapager"></div>
	   <div class="bemodify_area" id="bemodify_area" style="display:none;">
   		<a href="javascript:void(0);" onclick="hideEditarea(2);" class="close"></a>
   		<p><span class="importfile_label">上传批注文档：</span><input class="import_file" type="file" id="submit_annotations" name="submit_annotations" value="" /></p>
		<p><span class="addtion_label">文档附言：</span></p>
		<textarea class="addtion_area" id="addtion">无</textarea>
		<p><a href="javascript:void(0);" onclick="submit_reject()" class="submit_bt1">提&nbsp;&nbsp;&nbsp;交</a>  <p>
	   </div>
	   <div class="pass_area" id="pass_area" style="display:none;">
		<a href="javascript:void(0);" onclick="hideEditarea(1);" class="close"></a>
		<p><span class="pass_label">同意学生初稿通过审核</span><input type="hidden" id="taskId" /><input type="hidden" id="paperId" /></p>
		<p><span class="importfile_label">上传导师意见表：</span>
		<input id="submit_views" name="submit_views" type="file" value="" /></p>
		<p><a href="javascript:void(0);" onclick="submit_pass()" class="submit_bt1">提&nbsp;&nbsp;&nbsp;交</a></p>
	   </div>
   </div>
 </div>