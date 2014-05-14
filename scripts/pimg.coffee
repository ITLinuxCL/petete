# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot pimg - Reply with pong

module.exports = (robot) ->
  robot.respond /pimg (.*)/i, (msg) ->
	  query = escape(msg.match[1])
	  url = "http://pimg.zbox.cl/watchdog/?id=#{query}"
	  msg.http("http://pimg.zbox.cl/watchdog/query.json?id=#{query}")
	  .get() (err, res, body) ->
		  json = JSON.parse(body)
		  if json.listed
			  msg.send "#{query} Esta en listas negras: #{url}"
		  else
			  msg.send "#{query} No esta en listas negras"