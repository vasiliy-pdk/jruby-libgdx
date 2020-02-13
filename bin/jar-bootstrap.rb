require_relative '../lib/libgdx.rb'
require_relative '../lib/game.rb'

config = LwjglApplicationConfiguration.new()
config.title = 'JRuby libGDX 3D Sampe'
config.width = 1900
config.height = 1080
config.resizable = true

LwjglApplication.new(Game.new, config)