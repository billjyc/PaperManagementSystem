<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script  type="text/javascript">

	$("#list").jqGrid({	
		url:'getpassedproposal.do',
     	datatype: 'json',
     	mtype: 'POST',
     	colNames:['学号','姓名','开题报告'],
		colModel:[    
        {name:'studentNumber',index:'studentNumber', width:150,resizable:false,sorttype:"string"},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentName',width:150,resizable:false,sortable:false},        
        {name:'proposalAddress',width:380,resizable:false,sortable:false,
        	formatter: function(cellvalue, options, rowObject) {
                return  "<a href='..\\" + cellvalue + "'>下载文件</a>";
            }
        },          
     	],    
    	pager: '#datapager',	
    	pgbuttons : false,
    	pgtext : null,
		multiselect: false,	
		sortname: 'studentNumber',
		viewrecords: true,
		sortorder: "desc", 
		height:"100%",   
		width : 900,
		cellEdit:false,	
		jsonReader: { 
			root: "list",
     		userdata : "list",
        	repeatitems : false    
     	},
     	
     	loadComplete:function(data){
		  if(data.list.length==0){   
			$("#list").append('<tr><td colspan="5">&nbsp;&nbsp;暂无记录！</td></tr>');
		  }
	    }
		});
                
      $("#list").navGrid('#datapaper',{edit:false,add:false,del:false});
</script>

<div class="sub_container">
	<div class="table_container">
       <div class="title"><h2>已通过开题报告</h2></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
	</div>   
</div>
