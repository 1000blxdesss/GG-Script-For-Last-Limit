Java.perform(function() {
  var ChatClass = Java.use('Moduls.chat.Chat');
  ChatClass.incomeMessage.implementation = function(chatMessage) {
    
    var message = chatMessage.message.value;
    var playerName = chatMessage.playerName.value;
    var channeltype = chatMessage.channelType.value;
   
    var output = `[chatHook]channelType ${channeltype}  ${playerName} : ${message}`;
    console.log(output);

    
    this.incomeMessage(chatMessage);
  };
});
