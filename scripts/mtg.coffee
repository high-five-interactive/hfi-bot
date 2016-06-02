# Description:
#   Provides magic the gathering information
#
# Dependencies:
#   "querystring": "0.1.0"
#
# Commands:
#   hubot cast <card> - look up <card> on Magic Oracle Database
#   [[<card>]] - look up <card> on Magic Oracle Database
#
# Author:
#   Alexandre Arpin

querystring = require('querystring')

module.exports = (robot) ->
  robot.respond /cast (.+)/i, (msg) ->
    url = "http://gatherer.wizards.com/Handlers/Image.ashx"
    card = msg.match[1] || "Dismal%20Failure"
    query = { type: "card", name: card }
    msg.send "#{url}?#{querystring.stringify(query)}#.jpg"

  robot.hear /\[{2}([\w|\s|\d]+)\]{2}/g, (res) ->
    for match in res.match
      card = match.replace(/\[|\]/g, '') || "Dismal%20Failure"
      url = "http://gatherer.wizards.com/Handlers/Image.ashx"
      query = { type: "card", name: card }
      res.send "#{url}?#{querystring.stringify(query)}#.jpg"
