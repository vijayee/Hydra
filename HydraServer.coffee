express= require('express')
_= require('lodash')
socket= require('socket.io')
https = require('https')
http = require('http')
fs= require('fs')
class HydraServer
  constructor:(options)->
    ###
      Bind Callbacks
    ###
    _.bindAll(@,'indexRoute','socketBroker')
    ###
      Establish Options
    ###
    options = {} if not options?
    @options = options
    @options.port= 8080 if not @options.port?
    @options.port= Number @options.port
    @options.dir= '/www' if not @options.dir?
    ###
      Establish Connection Listeners
    ###
    @app= express()
    @app.use(express.static(__dirname + @options.dir))
    @app.get '/', @indexRoute
    @server=http.createServer(@app)
    @io= socket(@server)
    @io.on 'connection', @socketBroker
    ###
    Establish Session Object
    ###
  indexRoute:(req,res)->
    res.sendFile(__dirname + @options.indexFile)
  startServer:->
    port= @options.port
    startMessage= ->
      console.log('Hydra Server listening on port '  + port)
    @server.listen @options.port, startMessage
  socketBroker: (socket)->
    #console.log(socket)
    socket.emit('connected', {sessionDetails:'so much detail'})

module.exports= HydraServer
###
class HydraSession
  constructor:(options)->
    {@host,}
  host: null
  port: null
###