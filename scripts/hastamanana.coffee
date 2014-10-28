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

despedidas = [
    "Nos vemos, %",
    "Que descanses, %",
    "Aprovecha de descansar, %",
    "Zapatillas de clavo..., %"
]

module.exports = (robot) ->
    robot.hear /(hasta ma.*na|nos belmont|nos vemos|buen fin de semana)/i, (msg) ->
        despedida = msg.random despedidas
        msg.send despedida.replace "%", "@#{msg.message.user.mention_name}"


module.exports = (robot) ->
    robot.hear /(voy .* y vuelvo | voy .* a comprar )/i, (msg) ->
        mensaje = msg.random voy_y_vuelvos 
        msg.send mensaje.replace "%", "@#{msg.message.user.mention_name}"
