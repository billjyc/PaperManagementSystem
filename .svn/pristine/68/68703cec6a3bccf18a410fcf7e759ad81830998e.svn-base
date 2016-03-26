<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script  type="text/javascript" >
	jQuery("#course_list").jqGrid({	//course_list为页面中需要显示内容的table的id
		url:'getcourseinfo.do',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['课程标号','课程名称','成绩','学年'],		//表格的显示字段
     	//colNames:['课程标号','课程名称','操作'','论文状态','论文版本号'],	
		colModel:[    
        {name:'courseNo',index:'courseNo', width:150,align:"center",resizable:false,sorttype:"string"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'courseName',index:'courseName', width:150,sorttype:"string",resizable:false},  
        {name:'score',index:'score', width:150,sorttype:"string",resizable:false},
         {name:'date',index:'date', width:150,sorttype:"string",resizable:false}
     	],    
		rowNum:10,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
    	rowList:[10,20,30],	//用来改变显示记录数，当选择时会覆盖rowNum参数传递到后台
    	pager: '#datapager',	//datapager为显示页码的div
           
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'course',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
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
     	
   
                	
     	loadComplete:function(data){ //完成服务器请求后，回调函数
		  if(data.records==0){ //如果没有记录返回，追加提示信息           
			$("#course_list").append('<tr><td colspan="5">&nbsp;&nbsp;暂无课程信息记录！</td></tr>');
		  }else{ //
		  
		  }
	    },
		
		onSelectRow: function(id){   
	//		alert("第"+id+"行被选中");  
		},
		
		onPaging:function(){
			//alert("翻页键被按下");
		}
   
		});
           	jQuery("#course_list").navGrid("#datapager", 
   		{
	        edit : false,
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
     
         
</script>
 <div class="center">
   <div class="table_container">
       <div class="title"><h2>课程信息</h2></div>
       <div class="opt"></div>
	   <table id="course_list"></table>
	   <div id="datapager"></div>
   </div>
 </div>