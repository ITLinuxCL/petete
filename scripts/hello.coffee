module.exports = (robot) ->
  robot.enter (response) ->
        msg.send "Hola #{response.message.user.name}, por fin apareciste."

