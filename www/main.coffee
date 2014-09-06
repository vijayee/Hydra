require.config
  paths:
    "socket.io": "lib/socket.io/socket.io-1.1.0"
    "jquery" : "lib/jquery/jquery"
    "aura" : "lib/aura/lib/aura"
    "base" : "lib/aura/lib/base"
    "aura.extensions" : "lib/aura/lib/aura.extensions"
    "platform" :"lib/aura/lib/platform"
    "logger": "lib/aura/lib/logger"
    "bower_components/underscore": "lib/underscore/undescore"
define ['socket.io','jquery','aura'], (io, $, Aura)->
  config={sources:{default:'./components'}}
  hydrator= new Aura(config)
  socket = io.connect('localhost:8080')
  socket.on 'connected', (data) ->
    console.log(data)
