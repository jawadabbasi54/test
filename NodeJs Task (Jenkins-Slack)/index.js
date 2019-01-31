const SlackBot = require('slackbots');
const axios = require('axios');
var request = require('request');
var promise = require('promise');
var async = require("async");

var fall_msg='';
var colr='';
var user_ts='';
var user_ch='';
var bname='';
var data='';

const bot = new SlackBot({
  token: 'xoxb-520780954817-536971922770-KButyA67RU1MgF4uz9jXHNHi',
  name: 'abode_bot'
});

// Start Handler
bot.on('start', () => {
  const params = {
    icon_url: 'https://a.slack-edge.com/66f9/img/services/jenkins-ci_128.png'
  };

  bot.postMessageToChannel(
    'builds',
    'Type "jenkins" to remotely execute jenkins job !',
    params
  );

});

// Error Handler
bot.on('error', err => console.log(err));

// Message Handler
bot.on('message', data1 => {
  if ((data1.type !== 'message') || (data1.subtype=="message_replied")) {
  return;
  }
 // console.log(data1);
 data=data1;

if(data.bot_id){
  
 bot_info(data.bot_id).then((bname) => {

//IF there is Jenkins Bot Response
if (bname == "jenkins")
{  
   console.log('Bot name: '+ bname);
    console.log('Bot id: '+ data.bot_id);

for (var i=0; i<data['attachments'].length ;i++)
{
  fall_msg = data['attachments'][i].fallback;
  colr = data['attachments'][i].color;
  
}
handleMessage(data.text, data.bot_id, data.ts, data.channel, bot.name,fall_msg, colr);
}


//IF there is a Slack Web Api Bot response
else if (bname == "Slack API Tester"){
    console.log('Bot name: '+ bname);
    console.log('Bot id: '+ data.bot_id);
  handleMessage(data.text, data.bot_id, data.ts, data.channel, bot.name,'','');
}


else  {
  handleMessage(data.text, "no bot_id", data.ts, data.channel, bot.name,'', '');
 }

 });
}

//If there is a simple message written by user on slack channel
else { 
  handleMessage(data.text, "no bot_id", data.ts, data.channel, bot.name,'', '');
   }


// Response to Data
function handleMessage(message, bot_id, ts_value, channel, bot_name, fall_msg, colr) {
   //console.log(bname);
   if (bname=="jenkins") 
   {
   thread_msg(ts_value, channel, bot_name, fall_msg, colr);
   }

  else //if (bname!="Slack API Tester")
  {  console.log(message);
   if (message=="jenkins") {
    user_ts= ts_value;
    user_ch=channel;
    var exec = require('child_process').exec;
    
    //Generate an API Token for public access
    //Go to Job => Build Triggers => Trigger builds remotely then copy & paste in curl command with API token 
    var args = "-I -u jawadabbasi:1110c8014fce809699845a351d9e6c5196 http://127.0.0.1:8080/job/slack/build?token=4321";
    exec('curl ' + args, function (error, stdout, stderr) {
      console.log('stdout: ' + stdout);
      console.log('stderr: ' + stderr);
      if (error !== null) {
        console.log('exec error: ' + error);
                          }
                              });
                          }
  }

} 


});



function thread_msg(thread_ts, channel, bot_name, fall_msg, colr) {
  var api= 'https://slack.com/api/chat.postMessage?';
  var token= 'token=xoxp-520780954817-522787814374-538153391943-7af1d3604589b33cf1725f1bac04178f&';
  var channel_id='channel='+user_ch+'&';
  var thread_tss = 'thread_ts='+user_ts+'&';
  var text='';
  var attachment= 'attachments= [{"text" : "'+fall_msg+'", "color" : "'+colr+'"}] ';
  var botname='username=Jenkins&';
  var icon_url= 'icon_url=https://a.slack-edge.com/66f9/img/services/jenkins-ci_128.png&';
  var path = api+token+channel_id+thread_tss+botname+icon_url+attachment;
//  console.log(path);
   request.get(api+token+channel_id+thread_tss+botname+icon_url+text+attachment);

}

function bot_info(bot_id){
 
 return new Promise(function(resolve, reject) {

request('https://slack.com/api/bots.info?token=xoxp-520780954817-522787814374-538153391943-7af1d3604589b33cf1725f1bac04178f&bot='+bot_id+'&pretty=1', function (error, response, body) {
    if (!error && response.statusCode == 200) {
      
    var info = JSON.parse(body);
    bname = info['bot'].name;
    resolve(bname);
        }
});

});

}