import consumer from "./consumer"

consumer.subscriptions.create("ChatChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  	console.log("yiha we r live!");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
   $('#chatbox').prepend('<div><span class="mess-name">' +'['+ data.timee + '] ' + data.namee + ': ' + '</span>' + data.contentt + '</div>')
   $('.form-control').val("")
   console.log(data)

  	// var messages = $('#chatbox');
  	// messages.append(data['message']);
  	// messages.scrollTop(messages[0].scrollHeight);
  }
});
