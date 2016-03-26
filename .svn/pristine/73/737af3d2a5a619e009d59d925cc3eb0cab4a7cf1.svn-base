<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script type="text/javascript" src="../js/ajaxfileupload.js"></script>
<script  type="text/javascript">
	//显示评审页面
	function showReview(paperId,taskId){
		$(".decision_area").show();
		$("#paperId").attr("value",paperId);
		$("#taskId").attr("value",taskId);
	}
	//隐藏提交评审页面
	function hideDecision(){
		$(".decision_area").hide();
	}
	function submit_review(){
	if ($("input[name='submit_file']").val() == "") {
			alert("请选择文件！");
			return;
		}
		var type = $("input:radio:checked").val();
		var map = ["passed","reject"];
		var paperId = $("#paperId").val();
		var taskId = $("#taskId").val();
		var judgeContentStudent = $("#judge_content_student").val();
		var judgeContentTeacher = $("#judge_content_teacher").val();
		var jsonObj = {
			"paperid" : paperId,
			"taskid" : taskId,
			"result" : map[type],
			"judge_content_student" : judgeContentStudent,
			"judge_content_teacher" : judgeContentTeacher
		};
		$.ajaxFileUpload({
			url : "./submitreview.do",
			secureuri : false,
			fileElementId : "submit_file",
			dataType : "json",
			data :jsonObj,
			success : function(data, status)
			{
				$(".decision_area").hide();
				alert("提交成功！");
				jQuery("#review_list").trigger("reloadGrid");
			},
			error : function(data, status, e)
			{
			}
		});
	}
	
	
	jQuery("#review_list").jqGrid({	//review_list为页面中需要显示内容的table的id
		url:'reviewlist.do',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['学号','姓名','论文标题','论文版本号','操作','截止日期'],		//表格的显示字段
		colModel:[    
        {name:'studentNumber',index:'studentNumber', width:150,align:"center",resizable:false,sorttype:"string"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentName',index:'studentName', width:150,sorttype:"string",resizable:false},        
        {name:'paperTitle',index:'paperTitle',width:200,resizable:false},          
        {name:'paperVersion',index:'paperVersion', width:100,align:"center",resizable:false},
        {name:'opt',index:'opt',width:150,resizable:false,sortable:false,align:"center"},
        {name:'deadline',index:'deadline',width:150,resizable:false,align:"center"}    
     	],    
		rowNum: 9999,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
    	pager: '#datapager',	//datapager为显示页码的div
           
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'studentNumber',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
		viewrecords: true,	//是否显示记录总数
		sortorder: "desc", 
		height:"400px",   
		jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
			root: "list",  //包含实际数据的数组
     		userdata : "list",
        	repeatitems : false    
     	},
     	
     	loadComplete:function(data){ //完成服务器请求后，回调函数
		  if(data.list.length==0){ //如果没有记录返回，追加提示信息           
			$("#review_list").append('<tr><td colspan="5">&nbsp;&nbsp;暂无待评审记录！</td></tr>');
		  }else{ //否则，删除提示
			var ids = jQuery("#review_list").jqGrid('getDataIDs');
		    for(var i=0;i < ids.length;i++){
		        var cl = ids[i];
		        var userd = jQuery("#review_list").getGridParam('userData')[cl-1];
				decide = "<input style='height:22px;width:100px;margin-right:10px;' type='button' value='提交评审意见' onclick=\"showReview("+userd.paperId+","+userd.taskId+");\"  />"; 		
				jQuery("#review_list").jqGrid('setRowData',cl,{opt:decide});
				download = "<a title=\"点击下载论文\"  onclick=\"downloadPaper("+cl+")\" style='cursor:pointer;'>"+userd.paperTitle+"</a>"; 		
				jQuery("#review_list").jqGrid('setRowData',cl,{paperTitle:download});
		    }
			
		  }
	    },
		
		onSelectRow: function(id){   
		},
		
		onPaging:function(){
		}
   
		});
                
      jQuery("#review_list").jqGrid('navGrid','#datapaper',{edit:false,add:false,del:false});
      function downloadPaper(cl){
	  	var userd=jQuery("#review_list").getGridParam('userData')[cl-1];
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
       <div class="title"><h2>待评审列表</h2></div>
       <div class="opt"></div>
	   <table id="review_list"></table>
	   <div id="datapager"></div>
	   <div class="decision_area" id="review_decision" style="display:none;">
	   		<div><a class="close" onclick="$('#review_decision').hide()">×</a></div>
	   		<div>
	   			<span>评审结论：</span>
	   			<input id="state1" type="radio" name="state" value="0" checked="checked" />通过
	   			<input id="state2" type="radio" name="state" value="1" />不通过
	   		</div>
	   		<div>
	   			<span>评审附言：<br />（给老师）</span>
	   			<textarea id="judge_content_teacher" rows="8" cols="70"></textarea>
	   		</div>
	   		<div>
	   			<span>评审附言：<br />（给学生）</span>
	   			<textarea id="judge_content_student" rows="8" cols="70"></textarea>
	   		</div>
	   		<div>
	   			<span>评审附件：</span>
	   			<input id="submit_file" name="submit_file" type="file" value="" />
	   		</div>
	   		<div><input type="hidden" id="paperId" /><input type="hidden" id="taskId" /><a class="submit" href="javascript:void(0);" onclick="submit_review();">提交</a></div>
	   </div>
   </div>
 </div>