<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<script type="text/javascript">
	function upload(data){
	      $( "#dialog" ).dialog( "open" );
	         var i=0;
            var t = setInterval(function() {
       
        	     $("#progressbar").progressbar("value", i);
        	     i=(i+20)%100;
        	     $("#list").trigger('reloadGrid');
             }, 300);
             
             $("#result").html("正在导入...");
		$.ajaxFileUpload({
	         url:"./importStudentExcel.do",         
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
         });
                
	}
  	function uploadscore(data){
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
	         fileElementId:"scorefile", 
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
         });
                
	}
	
	jQuery("#list").jqGrid({
		url:'getallstudents.do?type=1',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['ID','学号','姓名','年级','班级','攻读学位','类型','联系电话','备用电话','邮件地址'],		//表格的显示字段
		colModel:[    
		{name:'studentId',index:'studentId',hidden:true},
        {name:'studentNumber',index:'studentNumber',width:150,resizable:false,editable:true,sorttype:"string",editoptions:{size:15}},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentName',width:150,editable:true,resizable:false,editoptions:{size:10}},    
        {name:'studentGrade',width:150,editable:true,resizable:false,formatter:"select",edittype:'select',editoptions:{value:{1:'一年级',2:'二年级',3:'三年级'}}},
        {name:'className',width:150,editable:true,resizable:false},    
		{name:'studentDegreeType',width:150,editable:true,resizable:false,formatter:"select",edittype:'select',editoptions:{value:{1:'工程硕士',2:'工学硕士',3:'工学博士'}}},
	    {name:'studentType',hidden:true,viewable:true,editrules:{edithidden:true},editable:true,formatter:"select",edittype:'select',editoptions:{value:{1:'全日制',2:'在职'}}},
        {name:'studentPhone1',hidden:true,editable:true,viewable:true,editrules:{edithidden:true}},      
        {name:'studentPhone2',hidden:true,editable:true,viewable:true,editrules:{edithidden:true}},      
        {name:'studentEmail',width:200,editable:true,editoptions:{size:30},viewable:true,editrules:{edithidden:true}}
     	],    
    	pager: '#datapager',	//datapager为显示页码的div
    	rowNum: 10,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
    	rowList:[5,10,15],
    	lastpage:10,
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'studentNumber',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
		viewrecords: true,	//是否显示记录总数
		sortorder: "asc", 
		height: "auto", 
		width : "900px",  
		hidegrid : false,
		editurl: 'editstudent.do',
		jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
			root: "list",  //包含实际数据的数组
     		records:"records", //查询出的记录数
     		total : "total_pages",
     		page : "page",
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
	        edit : true,
	        add : true,
	        del : true,
	        view : false,
	        search : true,
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
      			postdata.studentId = rowdata.studentId;
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
		      	return {studentId: rowdata.studentId, oper: postdata.oper};
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
	   caption:"导入信息",   
	   buttonicon:"ui-icon-add",  
	   id : "import_information", 
	   onClickButton: function(e){
	       $("#file").click();
	   }
	}).navButtonAdd("#datapager",{  
	   caption:"导入成绩",   
	   buttonicon:"ui-icon-add",  
	   id : "import_score", 
	   onClickButton: function(e){
	       $("#scorefile").click();
	   }
	}).navButtonAdd("#datapager",{  
	   caption:"导出",   
	   id : "export_excel", 
	   onClickButton: function(e){  
	   location.href="./exportStudentExcel.do";
	   },   
	   position:"last"
	}) ;
	
   $(function() {
    $( "#progressbar" ).progressbar({
      value: 37
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
	   <div class="title"><h2>学生列表</h2></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
	   
	   <input type="file" style="display:none" id="file" name="file" onchange="upload(this.value);" />
	   <input type="file" style="display:none" id="scorefile" name="scorefile" onchange="uploadscore(this.value);" />
    </div>
</div>