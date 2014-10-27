despedidas = [
    "Nos vemos, %",
    "Que descanses, %",
    "Aprovecha de descansar, %",
    "Zapatillas de clavo..., %"
]
module.exports = (robot) ->
    robot.hear /(hasta ma.*na|nos belmont|nos vemos|buen fin de semana/i, (msg) ->
        despedida = msg.random despedidas
        msg.send despedida.replace "%", msg.message.user.name
