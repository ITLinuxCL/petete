module.exports = (robot) ->
  robot.enter (msg) ->
        msg.send "Hola #{response.message.user.name}, por fin apareciste."

