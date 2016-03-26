<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<script type="text/javascript">
	
	
jQuery("#list").jqGrid({
		url:'classAssignedList.do?type=1',
     	datatype: 'json',
     	mtype: 'POST',
     	colNames:['studentID','学号','学生姓名','班级编号','班级名称','教学点编号'],		//表格的显示字段
	    colModel:[    
			{name:'studentId',hidden:true},
	        {name:'studentNumber',width:150,resizable:false},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
	        {name:'studentName',width:150,resizable:false},    
	        {name:'classNo',index:'no', width:150,editable:true,sorttype:"string",resizable:false}, 
            {name:'className',width:150, editable:true,viewable:true,editrules:{edithidden:true}},  
            {name:'teachingPointNo',width:150, editable:true,viewable:true,editrules:{edithidden:true}},      
	     	],    
		pager: '#datapager',	//datapager为显示页码的div
    	pgbuttons: false,
    	pgtext: null,
    	scrollrows: true,
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'classNo',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
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
        	groupField: ['className'],
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
	   location.href="./exportClassAssignedExcel.do";
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
       <div class="title"><h2>已分配班级列表</h2></div>
       <div class="opt"></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
    </div>
    </div>