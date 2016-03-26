var stompClient = null;

	/**
	 * 与服务器进行websocket的连接
	 */
function connect(accountId, teacherId) {
	var socket = new SockJS("/papermanagementsystem/suggestion");
	
    //var socket = new WebSocket("ws://localhost:8080/websocket-api/hello");
	stompClient = Stomp.over(socket);
	console.log(stompClient == null);
	stompClient.connect({}, function(frame) {
		//console.log('Connected: ' + frame);
				
		stompClient.subscribe('/app/initMessage/' + accountId + '/' + teacherId, function(msg) {
			//console.log(msg);
			var message = JSON.parse(msg.body);
			showMessage(message);
		});
				
		stompClient.subscribe('/getMessage', function(msg) {
			//console.log("GET MESSAGE FROM SERVER");
			var message = JSON.parse(msg.body);
			showMessage(message);
		});
		
		stompClient.subscribe('/app/initMessage/getNotReadSuggestion/' + accountId, function(msg) {
			console.log("teacher receive message");
			//该教师未读消息的数量
			var num = Number(msg.body);
			if(num > 0) 
				$.growl.notice({ message: "你有新的未读消息，请到会话中查看!" });
		});
		
		stompClient.subscribe('/receiveMessage/' + accountId, function(msg) {
			var message = msg.body;
			$.growl.notice({ message: message });
		});
	});
}
	
function showMessage(data) {
	console.log("refresh datas...");
	$('#studentInfo').html(data.studentInfo);
	$('#uncheckedProposal').html(data.uncheckedProposal);
	$('#passedProposal').html(data.passedProposal);
	$('#uncheckedInterim').html(data.uncheckedInterim);
	$('#passedInterim').html(data.passedInterim);
	$('#allThesis').html(data.allThesis);
	$('#firstCheck').html(data.firstCheck);
	$('#beforeDefense').html(data.beforeDefense);
	$('#reprieveList').html(data.reprieveList);
	$('#defenseFinalized').html(data.defenseFinalized);
	$('#completePaper').html(data.completePaper);
	$('#needReply').html(data.needReply);
	$('#sendList').html(data.sendList);
	$('#inbox').html(data.inbox);
}
	
function disconnect() {
	if(stompClient != null) {
		stompClient.disconnect();
	}
	console.log('Disconnected');
}
	
function getMsg(accountId, teacherId) {
	//console.log(stompClient == null);
	stompClient.send("/app/getMsg/" + accountId + "/" + teacherId, {}, '');
}

function receiveMsg(accountId) {
	console.log("receive---")
	stompClient.send("/app/sendMessage/" + accountId, {}, '');
}