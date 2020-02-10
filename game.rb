class Game
  include ApplicationListener

  def create
    puts 'Starting MyGame'
    @fps_logger = FPSLogger.new
  end

  def render
    fps_logger.log
  end

  def resize(width, height)
  end

  def pause
  end

  def resume
  end

  def dispose
    puts 'Bye'
  end

  private

  attr_reader :fps_logger
end