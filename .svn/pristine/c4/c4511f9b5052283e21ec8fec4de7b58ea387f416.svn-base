var stompClient = null;

	/**
	 * 与服务器进行websocket的连接
	 */
function connect(studentAccountId) {
	var socket = new SockJS("/papermanagementsystem/suggestion");
	
	stompClient = Stomp.over(socket);
	console.log(stompClient == null);
	stompClient.connect({}, function(frame) {
		/*
		stompClient.subscribe('/receiveMessage', function(msg) {
			console.log("teacher receive message");
			$.growl.notice({ message: "你有新的消息，请到会话中查看!" });
		});*/
	});
}

function sendMsg(accountId, message) {
	console.log("student send message: " + message );
	stompClient.send("/app/sendMessage/" + accountId, {}, message);
}