<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script  type="text/javascript" >
		jQuery("#student_list").jqGrid({	//student_list为页面中需要显示内容的table的id
		url:'studentlist.do',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['学号','姓名','年级','攻读学位','类型','联系电话','备用电话','邮件地址','详情'],		//表格的显示字段
		colModel:[    
        {name:'studentNumber',index:'studentNumber', width:150,align:"center",resizable:false,sorttype:"string"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentName',index:'studentName', width:150,sorttype:"string",resizable:false},    
		{name:'studentGrade',index:'studentGrade', width:120,sorttype:"string",resizable:false,formatter:"select",editoptions:{value:{1:'研一',2:'研二'}}},
		{name:'studentDegreeType',hidden:true,viewable:true,editrules:{edithidden:true},resizable:false,formatter:"select",editoptions:{value:{1:'本科',2:'工程硕士',3:'工学硕士',4:'工学博士'}}},
	    {name:'studentType',hidden:true,viewable:true,editrules:{edithidden:true},resizable:false,formatter:"select",editoptions:{value:{1:'全日制',2:'在职'}}},    
        {name:'studentPhone1',index:'studentPhone',width:180,sortable:false,resizable:false},
        {name:'studentPhone2',hidden:true,viewable:true,editrules:{edithidden:true}},      
        {name:'studentEmail',index:'studentEmail',width:280,sortable:false,resizable:false},     
        {name:'more',index:'more', width:80,align:"center",viewable:false,sortable:false,resizable:false}      
     	],    
		rowNum:5,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
    	rowList:[5,10,15],	//用来改变显示记录数，当选择时会覆盖rowNum参数传递到后台
    	pager: '#datapager',	//datapager为显示页码的div
           
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'studentNumber',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
		viewrecords: true,	//是否显示记录总数
		sortorder: "asc", 
		height:"100%",   
		cellEdit:false,	//是否可以编辑表格
		lastpage:20,	//
//		caption: "2009 级",	//表格名称
		jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
			root: "list",  //包含实际数据的数组
			page: "page",  //当前页
     		total: "total_pages",//总页数
     		records:"records", //查询出的记录数
        	repeatitems : false    
     	},
     	
     	loadComplete:function(data){ //完成服务器请求后，回调函数
     	  //alert("load completed");
		  if(data.list.length==0){ //如果没有记录返回，追加提示信息           
			$("#student_list").append('<tr><td colspan="6">&nbsp;&nbsp;暂无学生记录！</td></tr>');
		  }else{ //
		    var ids = jQuery("#student_list").jqGrid('getDataIDs');
		    for(var i=0;i < ids.length;i++){
		        var cl = ids[i];
		        //alert(cl);
				info = "<span class='stu_info_icon' title='点击查看详情' onclick='show_info("+cl+")'></span>"; 		
				jQuery("#student_list").jqGrid('setRowData',cl,{more:info});
		    }
		  }
	    },
		
		onSelectRow: function(id){   
			//alert("选中第"+id+"行");
		},
		
		ondblClickRow: function(id){   
			$("#student_list").jqGrid('viewGridRow', id, 
			           {			   
				           caption: "查看详情",
				           closeOnEscape:true
				           });
		},
		
		onPaging:function(){
			alert("翻页键被按下");
		}
   
		});
		
		function show_info(id){
			$("#student_list").jqGrid('viewGridRow', id, 
				           {			   
					           caption: "查看详情",
					           closeOnEscape:true
					           });
		}
                
      jQuery("#student_list").jqGrid('navGrid','#datapaper',{edit:false,add:false,del:false});
               
</script>
 <div class="center">
   <div class="table_container">
       <div class="title"><h2>指导学生列表</h2></div>
       <div class="opt"></div>
	   <table id="student_list" class="student_list"></table>
	   <div id="datapager"></div>
   </div>
 </div>