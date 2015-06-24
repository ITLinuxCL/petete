# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:
#   hubot chupalo - Shows a funny blowjob pic

module.exports = (robot) ->
  robot.respond /un chupalo para (.*)/i, (msg) ->
    query = escape(msg.match[1])
    msg.send "Aqui tienes #{query} - http://itlinux-repo.s3.amazonaws.com/chupalo.jpg"