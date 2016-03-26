<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<script type="text/javascript">
	function upload(data){
	    $( "#dialog" ).dialog( "open" );
	   
	    var i=0;
        var t = setInterval(function() {
       		$("#progressbar").progressbar("value", i);
        	i=(i+20)%100;
        }, 300);
        $("#result").html("正在导入...");
	    $.ajaxFileUpload({
              url:"./importTeacherExcel.do",            //需要链接到服务器地址
              secureuri:false,
              fileElementId:"file",                        //文件选择框的id属性
              dataType: "json",                                     //服务器返回的格式，可以是json
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
	
	$("#list").jqGrid({
		url:'getallteachers.do',	//生成json数据的url源
     	datatype: 'json',    //从服务器端返回的数据类型，默认xml。可选类型：xml，local，json，jsonnp，script，xmlstring，jsonstring，clientside
     	mtype: 'POST',
     	colNames:['ID','编号','姓名','类别','学历','职称','资质','联系电话','邮件地址'],		//表格的显示字段
		colModel:[    
		{name:'teacherId',index:'teacherId',hidden:true},
        {name:'teacherNumber',index:'teacherNumber',width:100,resizable:false,editable:true,sorttype:"string",editoptions:{size:15}},    //name表格列的名称,index排序时字段的索引,width只能是像素，不能是百分比
        {name:'teacherName',width:100,sortable:false,editable:true,resizable:false,editoptions:{size:10}},    
		{name:'teacherClasses',index:'teacherClasses',width:100,editable:true,resizable:false,formatter:"select",edittype:'select',editoptions:{value:{INNERTEACHER:'校内',OUTERTEACHER:'校外'}}},  
		{name:'teacherEducation',width:100,sortable:false,editable:true,resizable:false,formatter:"select",edittype:'select',editoptions: { value: {BACHELOR:'本科',MASTER:'硕士',DORTOR:'博士',POSTDOCTOR:'博士后'}}},
		{name:'teacherJobTitle',width:100,sortable:false,editable:true,resizable:false,formatter:"select",edittype:'select',editoptions: { value: {INSTRUCTOR:'讲师',SENIORENGINEER:'高级工程师',ASSOCIATEPROFESSOR:'副教授',FULLPROFESSOR:'教授'}}},  
        {name:'teacherQualification',width:100,sortable:false,editable:true,resizable:false,formatter:"select",edittype:'select',editoptions: { value: {ENGINEERING_MASTER_TUTOR:'工程硕士导师',ACADEMIC_MASTER_TUTOR:'工学硕士导师',ACADEMIC_DOCTOR_TUTOR:'博导'}}},  
        {name:'teacherPhone',width:150, editable:true,viewable:true,editrules:{edithidden:true}},      
        {name:'teacherEmail',width:250,editable:true,editoptions:{size:30},viewable:true,editrules:{edithidden:true}}
     	],    
    	pager: '#datapager',	//datapager为显示页码的div
    	pgbuttons: true,
    	rowNum: 10,	//在grid上显示记录条数，也就是pageSize，这个参数是要被传递到后台
    	rowList:[5,10,20,30,40,50],
    	lastpage: 10,
    	//pgtext: null,
    	//scrollrows: true,
		multiselect: false,	//是否可多选，多选的话前面有多选框    
		sortname: 'teacherNumber',    //默认的排序列。可以是列名称或者是一个数字，这个参数会被提交到后台
		viewrecords: true,	//是否显示记录总数
		sortorder: "asc", 
		height: "auto",
		width: "930px",   
		editurl: 'editteacher.do',
		jsonReader: {    //jsonReader来跟服务器端返回的数据做对应
			root: "list",  //包含实际数据的数组
     		records:"records", //查询出的记录数
     		total : "total_pages",
     		page : "page",
        	repeatitems : false    
     	},
    	grouping: true,
   		groupingView: {
       		groupField: ['teacherClasses'],
       		groupColumnShow: false
    	},
     	loadComplete:function(data){ //完成服务器请求后，回调函数
		  if(data.list.length==0){
			$("#list").append('<tr><td colspan="7">&nbsp;&nbsp;暂无记录！</td></tr>');
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
	   caption:"导入信息",   
	   buttonicon:"ui-icon-add",   
	   onClickButton: function(e){ 
	   		$("#file").click();  
	   },   
	   position:"last"
	}).navButtonAdd("#datapager",{  
	   caption:"导出信息",   
	   id : "export_excel", 
	   onClickButton: function(e){  
	   location.href="./exportTeacherExcel.do";
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
<div id="dialog" title="导入老师表">
  <div id="progressbar" ></div>
  <div id="result"  style="color:red; font-size:18px;"></div>
  </div>
	<input type="file" style="display:none" onchange="upload(this.value)" id="file" name="file" />
	
	<div class="table_container">
       <div class="title"><h2>教师列表</h2></div>
       <div class="opt"></div>
	   <table id="list"></table>
	   <div id="datapager"></div>
    </div>
</div>