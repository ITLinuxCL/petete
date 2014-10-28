# Description:
#  Petete se despide 
#
# Commands:
#   hasta mañana y otras

despedidas = [
    "Nos vemos, %",
    "Que descanses, %",
    "Aprovecha de descansar, %",
    "Zapatillas de clavo..., %",
    "Tomate una por mi ;)"
]

module.exports = (robot) ->
    robot.hear /(hasta ma.*na|nos belmont|nos vemos|buen fin de semana|chavelas)/i, (msg) ->
        despedida = msg.random despedidas
        msg.send despedida.replace "%", "@#{msg.message.user.mention_name}"

