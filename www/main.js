// Generated by CoffeeScript 1.7.1
(function() {
  require.config({
    paths: {
      "socket.io": "lib/socket.io/socket.io-1.1.0",
      "jquery": "lib/jquery/jquery",
      "aura": "lib/aura/lib/aura",
      "base": "lib/aura/lib/base",
      "aura.extensions": "lib/aura/lib/aura.extensions",
      "platform": "lib/aura/lib/platform",
      "logger": "lib/aura/lib/logger",
      "bower_components/underscore": "lib/underscore/undescore"
    }
  });

  define(['socket.io', 'jquery', 'aura'], function(io, $, Aura) {
    var config, hydrator, socket;
    config = {
      sources: {
        "default": './components'
      }
    };
    hydrator = new Aura(config);
    socket = io.connect('localhost:8080');
    return socket.on('connected', function(data) {
      return console.log(data);
    });
  });

}).call(this);

//# sourceMappingURL=main.map
