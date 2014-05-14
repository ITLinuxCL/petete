# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot pimg - Reply with pong

module.exports = (robot) ->
  robot.respond /pimg (.*)/i, (msg) ->
    Pimg msg, msg.match[1], (result) ->
		msg.send result
		
Pimg = (msg, query) ->
	msg.http("http://pimg.zbox.cl/watchdog/query.json?id=#{query}")
		.get() (err, res, body) ->
        	try
          	  json = JSON.parse(body)
			  json


