<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<style>
	#import_file{z-index:1000;display:none;padding:10px;background-color:#eee;border:1px solid #bbb;}
</style>

<script type="text/javascript">
	
	$("#import_file").click(function(e){
		e.stopPropagation();
	});
	
	$(document.body).click(function(e){
		$("#import_file").hide();
	});
	
	$("#add_file_b").click(function(){
	      $.ajaxFileUpload(
                    {
                 url:"./importStudentExcel.do",            //需要链接到服务器地址
                secureuri:false,
                 fileElementId:"file",                        //文件选择框的id属性
                dataType: "json",                                     //服务器返回的格式，可以是json
                 success: function (data, status)            //相当于java中try语句块的用法
                { 
                       alert(data.result);
                 },
                 error: function (data, status, e)            //相当于java中catch语句块的用法
                {
                        alert(data.result);
                 }
             }
                    
                );
		$("#import_file").hide();
	});
	
	jQuery("#list").jqGrid({
		url:'getallstudents.do',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['ID','学号','姓名','年级','攻读学位','类型','联系电话','备用电话','邮件地址'],		//表格的显示字段
		colModel:[    
		{name:'studentId',index:'studentId',hidden:true},
        {name:'studentNumber',index:'studentNumber',width:150,resizable:false,editable:true,sorttype:"string",editoptions:{size:15}},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'studentName',width:150,editable:true,resizable:false,editoptions:{size:10}},    
        {name:'studentGrade',width:150,editable:true,resizable:false,formatter:"select",edittype:'select',editoptions:{value:{1:'研一',2:'研二'}}},
		{name:'studentDegreeType',width:150,editable:true,resizable:false,formatter:"select",edittype:'select',editoptions:{value:{1:'本科',2:'工程硕士',3:'工学硕士',4:'工学博士'}}},
	    {name:'studentType',width:150,editable:true,resizable:false,formatter:"select",edittype:'select',editoptions:{value:{1:'全日制',2:'在职'}}},
        {name:'studentPhone1',hidden:true,editable:true,viewable:true,editrules:{edithidden:true}},      
        {name:'studentPhone2',hidden:true,editable:true,viewable:true,editrules:{edithidden:true}},      
        {name:'studentEmail',hidden:true,editable:true,editoptions:{size:30},viewable:true,editrules:{edithidden:true}}
     	],    
    	pager: '#datapager',	//datapager为显示页码的div
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'studentNumber',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
		viewrecords: true,	//是否显示记录总数
		sortorder: "asc", 
		height:"100%",   
		editurl: 'editstudent.do',
		jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
			root: "list",  //包含实际数据的数组
     		records:"records", //查询出的记录数
     		total_pages : "total_pages",
     		page : "page",
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
	        view : true,
	        search : false
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
      			postdata.teacherId = rowdata.teacherId;
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
		      	return {teacherId: rowdata.teacherId, oper: postdata.oper};
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
	   caption:"导入Excel",   
	   buttonicon:"ui-icon-add",   
	   onClickButton: function(e){   
	       e.stopPropagation();
		   $("#import_file").css({"position":"absolute",
							   "top":$(this).offset().top + 200,
							   "left":$(this).offset().left + 100
							   }).show(); 
	   },   
	   position:"last"
	})  ;
</script>

<div class="sub_container">
	<table id="import_file">
		<tr><td>学生Excel表(格式依照本页教师列表)</td></tr>
		<tr><td><input type="file" id="file" name="file" /></td></tr>
		<tr><td> <div class="button" id="add_file_b">提交</div></td></tr>
	</table>
	
	<div class="table_container">
       <div class="title"><h2>学生列表</h2></div>
       <div class="opt"></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
    </div>
</div>