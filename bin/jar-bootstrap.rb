require_relative '../lib/libgdx.rb'
require_relative '../lib/game.rb'

config = LwjglApplicationConfiguration.new()
config.title = 'JRuby libGDX Hello World Example'
config.width = 800
config.height = 600
config.resizable = true

LwjglApplication.new(Game.new, config)