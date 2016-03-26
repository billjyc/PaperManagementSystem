<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<script type="text/javascript">




jQuery("#list").jqGrid({
		url:'checkedTranscript.do?type=1',
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['ID','课程编号','课程名称','学生学号','学生姓名','成绩','学年','状态'],		//表格的显示字段
		colModel:[ 
		{name:'courseId',index:'courseId',hidden:true},   
        {name:'courseNo',index:'courseNo', width:150,resizable:false,editable:true,sorttype:"string",editoptions:{size:15}},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'courseName',index:'courseName', width:150,editable:true,sorttype:"string",resizable:false},        
        {name:'studentNo',index:'studentNo', width:150,editable:true,sorttype:"string",resizable:false}, 
        {name:'studentName',index:'studentName',width:100,sorttype:"string",resizable:false,editable:true},      
        {name:'score',index:'score',width:150,resizable:false,editable:true},
        {name:'date',index:'date',width:150,resizable:false,editable:true},
        {name:'state',index:'state',width:150,resizable:false,editable:true},
     	],    
		pager: '#datapager',	//datapager为显示页码的div
    	pgbuttons: false,
    	pgtext: null,
    	scrollrows: true,
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'studentNo',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
		viewrecords: true,	//是否显示记录总数
		sortorder: "asc", 
		height: "400px",
		width: 930,   
		rowNum: '9999',
		editurl: 'editcourse.do',
		jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
			root: "list",  //包含实际数据的数组
     		records:"records", //查询出的记录数
        	repeatitems : false   
     	},
		grouping: true,
	    groupingView: {
        	groupField: ['courseName'],
        	groupText : ['<strong>{0}</strong>'],
        	groupColumnShow: true
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
  add : false,
	        del : false,
	        view : false,
	        search:false,
	        refresh: true
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
      			var rowdata = $("#list").getRowData(postdata.id);
      			postdata.courseId = rowdata.courseId;
		      	return postdata;
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
        }
    ).navButtonAdd("#datapager",{  
	   caption:"导出信息",   
	   id : "export_excel", 
	   onClickButton: function(e){  
	   location.href="./exportTranscriptExcel.do";
	   },   
	   position:"last"
	}) ;
	
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
	   <div class="title"><h2>成绩列表</h2></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
	   
	   <input type="file" style="display:none" id="file" name="file" onchange="upload(this.value);" />
    </div>
    

</div>