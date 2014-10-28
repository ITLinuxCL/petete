# Description:
#  Petete se despide 
#
# Commands:
#   hasta mañana y otras

voy_y_vuelvos = [
   "Vaya por la sombrita,  %",
   "No se demore mucho, %",
   "Traeme algo, no seas amarrete %",
   "Cuentate una de vaqueros,  %"
]

module.exports = (robot) ->
    robot.hear /(voy.*vuelvo|voy.*comprar)/i, (msg) ->
        mensaje = msg.random voy_y_vuelvos 
        msg.send mensaje.replace "%", "@#{msg.message.user.mention_name}"
