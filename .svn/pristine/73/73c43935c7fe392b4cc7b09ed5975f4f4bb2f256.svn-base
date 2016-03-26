<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<script>
	$(document).ready(function(){
	    $.post("../suggestions/getSuggestionMap.do",{},function(data){ 
	      if(data.result_json=="success"){
		       show_list(data.list);
	      }
	       	     
//	        list= Object.keys(data);
//	        alert(data['091250026_ding']['2013-04-22'][0].level);
//            list= Object.keys(data);
//            for(var i=0;i<list.length;i++){
//              alert(Object.keys(data[list[i]]));
//            }
         
			$(".record_theme").mCustomScrollbar({
				autoHideScrollbar:true,
				scrollButtons:{
					enable:true
				},
				theme:"dark-thick"
			});
			
			},"json");
			
			$(".record_detail").mCustomScrollbar({
		    autoHideScrollbar:true,
			scrollButtons:{
				enable:true
			},
			theme:"dark-thick"
		});
			
	});
	
	function expand(Obj){
	  if($(Obj).parent(".communication").find(".reply_content").css("display")=="none"){
	      $(Obj).parent(".communication").find(".reply_content").css("display","block");
	      $(Obj).children(".icon").removeClass("expand");
	      $(Obj).children(".icon").addClass("shrink");
	  }else
	  {
	      $(Obj).parent(".communication").find(".reply_content").css("display","none");
	      $(Obj).children(".icon").removeClass("shrink");
	      $(Obj).children(".icon").addClass("expand");
	  }
	  
	  $(".record_detail").mCustomScrollbar("update");
	  
	}
	
	function show_list(lst){
	 list_keys= Object.keys(lst);
	 //show first
	 var val=new Object();
	 val=lst[list_keys[0]];
	 show_detail(val);
	 //total 
	 var total=0;
	     for(i in list_keys){
	            var val=lst[list_keys[i]];
	            var sub_keys=Object.keys(val);
	            var encode_val=htmlencode(JSON.stringify(val));
	            var count=0;//会话数
	            for(j in sub_keys){
	               count=count+val[sub_keys[j]].length;
	            }
	            total=total+count;
				$(".record_theme").append(
				'<div class="record" onclick="show_detail('+encode_val+')">'+				
	        		'<div class="record_title">'+' '+'</div>'+
	        		'<div class="info">'+
	          			'<div class="sender">'+list_keys[i]+'</div>'+
	          			'<div class="time_right">'+'共&nbsp<b>'+count+'</b>&nbsp条记录'+'</div>'+
	        		'</div>'+
	        		'<div class="clear"></div></div>');
	        	}
	 $(".record_total .total").html(total);
	};
	
	function show_detail(val){
	           var keys=Object.keys(val);
//	           alert(keys);
               $(".record_detail .suggestion").remove();
	           for(i in keys){
	             var key=keys[i];
	             var lst=new Object();
	             for(j in val[key]){
		            str='<div class="communication">'+
		                  '<div class="communication_field" onclick="expand(this);">'+
		                     '<div class="icon expand"></div>'+
		                     '<div class="name">'+val[key][j].senderName+'</div>'+
		                     '<div class="short_content text_over" title="'+val[key][j].suggestTitle+'">'+val[key][j].suggestTitle+'</div>'+
		                     '<div class="time">'+val[key][j].suggestTime+'</div>'+
		                     '<div class="clear"></div>'+	                    
		                   '</div>'+
		                   '<div class="reply_content" style="display:none;">'+
		                     '<div class="info">'+
		                       '<div class="sender">发件人：'+val[key][j].senderName+'</div>'+
		                       '<div class="time_right">'+val[key][j].suggestTime+'</div>'+
		                       '<div class="clear"></div>'+
		                     '</div>'+
		                     '<div class="attachments">'+
		                       '<span>附件：</span>'+
		                       '<span class="attachment"><a href="">附件一</a></span>'+
		                     '</div>'+
		                     '<div class="bodytxt">'+val[key][j].suggestContent+
		                     '</div>'+
		                   '</div>'+
		                 '</div>';
	                lst[j]=str;
	             }
	             
	             var result='';
	             for(k in lst)
	               result=result+lst[k];
	             
//	             alert("str: "+result);
	             $(".record_detail .mCSB_container").append(
	             '<div class="suggestion">'+
	               '<div class="date">'+key+'</div>'+
	                 '<div class="communications">'+result+
	                 '</div>'+
	             '</div>'
	               
	             );
	             
	             $(".record_detail").mCustomScrollbar("update");
	             $(".record_detail").mCustomScrollbar("scrollTo","last");
	             
	           }
	           
	//           $(".record_detail").append();
           
	}
	
	
	
	function htmlencode(str) {
	  str=str.replace(/"/g, '&quot;');
	  str=str.replace(/</g, '&lt;');
	  str=str.replace(/>/g, '&gt;');
	  return str;
	}
	
	function htmldecode(str) {
	  str=str.replace(/&lt;/g, '<');
	  str=str.replace(/&gt;/g, '>');
	  str=str.replace(/&quot;/g, '"');
	  return str;
	}
             
</script>
<div class="record_container">

 <div class="record_op">
   <div class="ops">
     <div class="op">
       <div class="filter s1">
         <div class="place">
           <div class="filter_icon"></div>
         </div>
       </div>
     </div>
     <div class="op">
       <div class="s1">
         <div class="place">
           <div class="refresh_icon"></div>
         </div>
       </div>
     </div>
   </div>
   <div class="page_divide">
    <div class="record_total">
      <span>您共有</span>
      <span class="total">0</span>
      <span>条交互记录</span>
    </div>
   </div>
   <div class="clear"></div>
 </div>
 
 <div class="record_content rc">
    <div class="record_theme"></div>
    <div class="record_detail">
    </div>
    <div class="clear"></div>
 </div>
</div>