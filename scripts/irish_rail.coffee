# Description:
#   Fetches realtime information for dart stations
#
# Commands:
#   hubot list the dart stations - Lists all dart stations
#   hubot when is the next northbound dart due at <station> - Responds with the realtime info for the next northbound train at a given station
#   hubot when is the next southbound dart due at <station> - Responds with the realtime info for the next southbound train at a given station
#
# Author:
#   Thomas Cullen <thomascullen92@gmail.com>

parseString = require('xml2js').parseString

module.exports = (robot) ->

  robot.hear /list the dart stations/i, (msg) ->
    robot.http("http://api.irishrail.ie/realtime/realtime.asmx/getAllStationsXML_WithStationType?StationType=D")
    .get() (err, res, body) ->
      if err
        msg.send "There was a problem querying the dart API"
        return
      else
        botResponse = ""
        parseString body, (parse_err, parse_result) ->
          Array::forEach.call parse_result.ArrayOfObjStation.objStation, (station, i) ->
            botResponse += "#{station.StationDesc}, "
          msg.send botResponse
          return

  robot.hear /when is the next northbound dart due at (.*)/i, (msg) ->
    station = msg.match[1]
    getNextTrain(msg, station, "Northbound")

  robot.hear /when is the next southbound dart due at (.*)/i, (msg) ->
    station = msg.match[1]
    getNextTrain(msg, station, "Southbound")

  getNextTrain = (msg, station, direction) ->
    robot.http("http://api.irishrail.ie/realtime/realtime.asmx/getStationDataByNameXML?StationDesc=#{station}")
    .get() (err, res, body) ->
      if err
        msg.send "Sorry, I had some troubles parsing the dart API"
        return
      else
        parseString body, (parse_err, parse_result) ->
          if parse_result.ArrayOfObjStationData.objStationData
            i = 0
            while i <= parse_result.ArrayOfObjStationData.objStationData.length
              train = parse_result.ArrayOfObjStationData.objStationData[i]
              if train.Direction[0] == direction
                msg.send "The next #{direction.toLowerCase()} dart due at #{station} is the #{train.Destination} service, which is due in #{minutes(train.Duein)}"
                break
              i++
            return
          else
            msg.send "I could not find a station by that name"
            return

  minutes = (amount) ->
    if amount > 1
      return "#{amount} minutes"
    else
      return "1 minute"