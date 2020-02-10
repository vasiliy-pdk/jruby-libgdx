java_import com.badlogic.gdx.graphics.GL20
java_import com.badlogic.gdx.graphics.OrthographicCamera
java_import com.badlogic.gdx.graphics.glutils.ShapeRenderer

class Game
  include ApplicationListener

  def create
    puts 'Starting MyGame'
    @fps_logger = FPSLogger.new
    @camera = OrthographicCamera.new
    camera.set_to_ortho false

    @shape_renderer = ShapeRenderer.new
    @circle = MovingCircle.new
  end

  def render
    Gdx.gl.gl_clear_color(0.25, 0.25, 0.25, 1)
    Gdx.gl.gl_clear(GL20::GL_COLOR_BUFFER_BIT)

    @circle.update

    camera.update
    shape_renderer.set_projection_matrix camera.combined
    shape_renderer.begin(ShapeRenderer::ShapeType::Filled)
    shape_renderer.set_color(1, 1, 0, 1)
    shape_renderer.circle(@circle.x, @circle.y, @circle.diameter)
    shape_renderer.end

    fps_logger.log
  end

  def resize(width, height)
  end

  def pause
  end

  def resume
  end

  def dispose
    shape_renderer.dispose
    puts 'Bye'
  end

  private

  attr_reader :fps_logger, :camera, :shape_renderer
end

class MovingCircle
  attr_reader :x, :y, :diameter

  def initialize(x = 0, y = 0, diameter = 20)
    @x = x
    @y = y
    @diameter = diameter
  end
  
  def update
    @x += 1
    @y += 1
  end
end