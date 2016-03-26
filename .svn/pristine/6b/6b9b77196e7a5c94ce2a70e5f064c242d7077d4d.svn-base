<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<em><script type="text/javascript">
	function submit_result(type, paperId, taskId){
		var detection = (type == 1 ? "true" : "false");
		var resultObj = {
			"paperId" : paperId,
			"taskId" : taskId,
			//"detection" : detection
		};
		var resultStr = "paperstr=" + JSON.stringify(resultObj);
		$.post("./applydegree.do", resultStr, function(msg){
			if(msg.result_json == "success")
				alert("提交成功！");
		},"json");
	}
	
	function upload(data){
	      $( "#dialog" ).dialog( "open" );
	         var i=0;
            var t = setInterval(function() {
       
        	     $("#progressbar").progressbar("value", i);
        	     i=(i+20)%100;
             }, 300);
             $("#result").html("正在导入...");
		$.ajaxFileUpload({
	         url:"./importScoreExcel.do",         
	         secureuri:false,
	         fileElementId:"file", 
	         dataType: "json", 
	         success: function (data, status){
	        clearInterval(t);
	        $("#progressbar").progressbar("value", 100);
	        $("#result").html(data.result);
            $("#list").trigger('reloadGrid');
	         },
	         error: function (data, status, e){      
	        clearInterval(t);
	        $("#progressbar").progressbar("value", 100);
	        $("#result").html(data.result);
	        
            $("#list").trigger('reloadGrid');}
         });};
         
             $(function() {
    $( "#progressbar" ).progressbar({
      value: 0
    });
  });	
 $(function() {
    $( "#dialog" ).dialog({
      autoOpen: false,
      show: {
        effect: "blind",
        duration: 1000
      },
      hide: {
        effect: "explode",
        duration: 1000
      }
    });
    });


	
	
	$("#list").jqGrid({	
		url:'afterdefencelist.do',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['学号','姓名','论文标题'],		//表格的显示字段
		colModel:[    
        {name:'studentNumber',index:'studentNumber', width:150,align:"center",resizable:false,sorttype:"string"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentName',index:'studentName', width:150,sorttype:"string",resizable:false},    
        {name:'paperTitle',index:'paperTitle',width:500,sortable:false,resizable:false}, 
        {name:'opt',index:'opt',width:260,resizable:false,sortable:false,align:"center"}  
     	],    
		rowNum:5,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
    	rowList:[5,10,15],	//用来改变显示记录数，当选择时会覆盖rowNum参数传递到后台
    	pager: '#datapager',	//datapager为显示页码的div
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'studentNumber',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
		viewrecords: true,	//是否显示记录总数
		sortorder: "asc", 
		multiselect: true,
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
				approve = "<input style='height:22px;width:60px;margin-right:10px;' type='button' value='归档' onclick=\"submit_result(1,"+$("#list").getGridParam('userData')[cl-1].paperId+","+$("#list").getGridParam('userData')[cl-1].taskId+");\"  />"; 
				$("#list").jqGrid('setRowData',cl,{opt:approve});
		    }
		  }
	    },
		
		onSelectRow: function(id){   
		},
		
		onPaging:function(){
		}
		});
                
     $("#list").navGrid("#datapager",{edit:false,add:false,del:false,search:false,refresh:false}).
      navButtonAdd("#datapager",{  
	   caption:"导出三个一",   
	   buttonicon:"ui-icon-add",  
	   id : "export_excel", 
	   onClickButton: function(e){
	     var data = $("#list").getGridParam('selarrrow');
	     var rowlist=[];
	     if(data != ""){
	    for(var i = data.length - 1; i >= 0; i--){
						var row = $("#list").getRowData(data[i]);
						rowlist.push(row);
						
					}
	      var resultStr="list="+JSON.stringify(rowlist);
	       location.href="./exportThree_OneExcel.do?"+resultStr;
	       //$.post("./exportThree_OneExcel.do",resultStr);
	   
	   }}
	});

</script></em>

<style>
	.sub_container{padding: 20px 20px;}
</style>

<script type="text/javascript">

</script>

<div class="sub_container">
 <input type="file" style="display:none" id="file" name="file"  onchange="upload(this.value);"   />
	<div class="table_container">
       <div class="title"><h2>学位申请</h2></div>
       <div class="opt"></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
    </div>
</div>