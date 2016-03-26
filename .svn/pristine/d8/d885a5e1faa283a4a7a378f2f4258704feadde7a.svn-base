<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script  type="text/javascript" >
	jQuery("#course_list").jqGrid({	//course_list为页面中需要显示内容的table的id
		url:'getallcourse.do',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['课程编号','课程名称','学年信息'],		//表格的显示字段
     		
		colModel:[    
		
        {name:'courseNo',index:'courseNo', width:150,resizable:false,sorttype:"string"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'courseName',index:'courseName', width:150,sorttype:"string",resizable:false},  
        {name:'date',width:150,resizable:false}
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
		
		rowNum:10,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
    	rowList:[10,20,30],	//用来改变显示记录数，当选择时会覆盖rowNum参数传递到后台
    	pager: '#datapager',	//datapager为显示页码的div
           
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		
		viewrecords: true,	//是否显示记录总数
		sortorder: "desc", 
		height:"100%", 
		
		cellEdit:false,	//是否可以编辑表格
		lastpage:20,	//
		jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
			root: "list",  //包含实际数据的数组
			page: "currPage",  //当前页
     		total: "totalPage",//总页数
     		records:"totalCount", //查询出的记录数
     		userdata : "list",
        	repeatitems : false    
     	}
   
		});
                
      jQuery("#course_list").jqGrid('navGrid','#datapaper',{edit:false,add:false,del:false});
      
    
      
</script>
 <div class="center">
   <div class="table_container">
       <div class="title"><h2>课程列表</h2></div>
       <div class="opt"></div>
	   <table id="course_list"></table>
	   <div id="datapager"></div>
   </div>
 </div>