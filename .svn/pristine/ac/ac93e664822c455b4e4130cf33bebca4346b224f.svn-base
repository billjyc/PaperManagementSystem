<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<script type="text/javascript">

jQuery("#list").jqGrid({
		url:'getAllFees.do?type=1',
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['ID','学生姓名','学生学号','费用类型','费用金额','发放时间','发放方式'],		//表格的显示字段
		colModel:[  
		{name:'id',index:'id',hidden:true},
        {name:'studentName',index:'studentName', width:100,resizable:false,editable:true,sorttype:"string",editoptions:{size:15}},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentNum',index:'studentNum', width:100,editable:true,sorttype:"string",resizable:false},
        {name:'feeType',index:'feeType', width:100,editable:true,sorttype:"string",resizable:false},
        {name:'amount',index:'amount', width:100,editable:true,sorttype:"string",resizable:false}, 
        {name:'grantTime',index:'grantTime',width:200,sorttype:"string",resizable:false,editable:true},    
        {name:'grantType',index:'grantType',width:100,sorttype:"string",resizable:false,editable:true}, 
     	],    
		pager: '#datapager',	//datapager为显示页码的div
    	pgbuttons: false,
    	pgtext: null,
    	scrollrows: true,
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortable:true,
		sortname: 'id',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
		viewrecords: true,	//是否显示记录总数
		sortorder: "asc", 
		height: "400px",
		width: 930,   
		rowNum: '9999',
		//editurl: 'editInstructionFees.do',
		jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
			root: "list",  //包含实际数据的数组
     		records:"records", //查询出的记录数
        	repeatitems : false   
     	},
	
	 	loadComplete:function(data){ //完成服务器请求后，回调函数
		  if(data.list.length==0){
			$("#list").append('<tr><td colspan="9">&nbsp;&nbsp;暂无记录！</td></tr>');
		  }else{
		  }
	    },
		
		ondblClickRow : function(id){
			$("#list").jqGrid('viewGridRow', id, {closeOnEscape:true} );
		}
	});
	
	jQuery("#list").navGrid("#datapager", 
   		{
	        edit : true,
	        add : true,
	        del : true,
	        view : false,
	        search:true,
	        refresh: false

    	}, 
         //search
        {
            caption : "查找",
            Find : "开始查找",
            closeAfterSearch : true
        },   
        //view 
        {
        	caption: "查看信息",  
   			bClose: "关闭"
        }
    );
	
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

</script>

<div class="sub_container">
<div id="dialog" title="导入数据">
  <div id="progressbar" ></div>
  <div id="result" style="color:red; font-size:18px;"></div>
  </div>

  
	<div class="table_container">
	   <div class="title"><h2>费用列表</h2></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
    </div>
</div>