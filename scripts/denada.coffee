# Description:
#   Responde cuando le dan las gracias 
#
# Commands:

module.exports = (robot) ->
  robot.respond /(gracias|se agradece|te pasaste|bac.*n|te amo)/i, (msg) ->
	  msg.send 'Solo existo para complacerte'
