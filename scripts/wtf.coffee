# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot WTF - just because

module.exports = (robot) ->
  robot.respond /wtf$/i, (msg) ->
	  msg.send 'Que!! ¿Te vay a parar CTM?'