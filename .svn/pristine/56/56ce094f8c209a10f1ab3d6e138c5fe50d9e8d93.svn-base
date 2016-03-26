<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<script type="text/javascript">
	
	
jQuery("#list").jqGrid({
		url:'studentCourseInfoList.do?type=1',
     	datatype: 'json',
     	mtype: 'POST',
     	colNames:['课程编号','课程名称','学号','姓名','学年'],	
		colModel:[    
        
        {name:'courseNo',index:'courseNo', width:330,sorttype:"string",resizable:false},   
        {name:'courseName',index:'courseName',width:150,sorttype:"string",resizable:false}, 
        {name:'studentNo',index:'studentNo', width:150,align:"center",resizable:false,sorttype:"string"}, 
        {name:'studentName',index:'studentName', width:150,sorttype:"string",resizable:false},       
        {name:'date',index:'date',width:150,resizable:false}
     	],    
		pager: '#datapager',	//datapager为显示页码的div
    	pgbuttons: false,
    	pgtext: null,
    	scrollrows: true,
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'courseNo',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
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
	        edit : false,
	        add : false,
	        del : false,
	        view : false,
	        search : false,
	        refresh: false
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
      			var rowdata = $("#list").getRowData(postdata.id);
		      	return {courseId: rowdata.courseId, oper: postdata.oper};
 			}
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
    ).navButtonAdd("#datapager",{  
	   caption:"导出信息",   
	   id : "export_excel", 
	   onClickButton: function(e){  
	   location.href="./exportStudentCourseInfoExcel.do";
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
       <div class="title"><h2>已选课程信息</h2></div>
       <div class="opt"></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
	   <input type="file" style="display:none" id="file" name="file" onchange="upload(this.value);" />
	   <input type="file" style="display:none" id="scorefile" name="scorefile" onchange="uploadscore(this.value);" />
    </div>
    </div>