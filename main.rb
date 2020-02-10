require_relative './lib/libgdx.rb'
require_relative './game.rb'

config = LwjglApplicationConfiguration.new()
config.title = 'JRuby libGDX Hello World Example'
config.width = 800
config.height = 600
config.resizable = false

LwjglApplication.new(Game.new, config)