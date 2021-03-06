# Description:
#   Forgetful? Add reminders
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot remind me in <time> to <action> - Set a reminder in <time> to do an <action> <time> is in the format 1 day, 2 hours, 5 minutes etc. Time segments are optional, as are commas
#
# Author:
#   whitman

class Reminders
  constructor: (@robot) ->
    @cache = []
    @current_timeout = null

    @robot.brain.on 'loaded', =>
      if @robot.brain.data.reminders
        @cache = @robot.brain.data.reminders
        @queue()

  add: (reminder) ->
    @cache.push reminder
    @cache.sort (a, b) -> a.due - b.due
    @robot.brain.data.reminders = @cache
    @queue()

  removeFirst: ->
    reminder = @cache.shift()
    @robot.brain.data.reminders = @cache
    return reminder

  queue: ->
    clearTimeout @current_timeout if @current_timeout
    if @cache.length > 0
      now = new Date().getTime()
      @removeFirst() until @cache.length is 0 or @cache[0].due > now
      if @cache.length > 0
        trigger = =>
          reminder = @removeFirst()
          @robot.reply reminder.msg_envelope, 'me pediste que te acordara de ' + reminder.action
          @queue()
        # setTimeout uses a 32-bit INT
        extendTimeout = (timeout, callback) ->
          if timeout > 0x7FFFFFFF
            @current_timeout = setTimeout ->
              extendTimeout (timeout - 0x7FFFFFFF), callback
            , 0x7FFFFFFF
          else
            @current_timeout = setTimeout callback, timeout
        extendTimeout @cache[0].due - now, trigger

class Reminder
  constructor: (@msg_envelope, @time, @action) ->
    @time.replace(/^\s+|\s+$/g, '')

    periods =
      weeks:
        value: 0
        regex: "semanas?"
      days:
        value: 0
        regex: "dias?"
      hours:
        value: 0
        regex: "horas?|hrs?"
      minutes:
        value: 0
        regex: "minutos?|mins?"
      seconds:
        value: 0
        regex: "segundos?|segs?"

    for period of periods
      pattern = new RegExp('^.*?([\\d\\.]+)\\s*(?:(?:' + periods[period].regex + ')).*$', 'i')
      matches = pattern.exec(@time)
      periods[period].value = parseInt(matches[1]) if matches

    @due = new Date().getTime()
    @due += ((periods.weeks.value * 604800) + (periods.days.value * 86400) + (periods.hours.value * 3600) + (periods.minutes.value * 60) + periods.seconds.value) * 1000

  dueDate: ->
    dueDate = new Date @due
    dueDate.toLocaleString()

module.exports = (robot) ->

  reminders = new Reminders robot

  robot.respond /(recuerdame|acuerdame) en ((?:(?:\d+) (?:semanas?|dias?|horas?|hrs?|minutos?|mins?|segundos?|segs?)[ ,]*(?:and)? +)+)que (.*)/i, (msg) ->
    time = msg.match[2]
    action = msg.match[3]
    reminder = new Reminder msg.envelope, time, action
    reminders.add reminder
    msg.send 'Ok, te acordaré de ' + action + ' en ' + time # + reminder.dueDate()
