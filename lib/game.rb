java_import com.badlogic.gdx.graphics.GL20
java_import com.badlogic.gdx.graphics.PerspectiveCamera
java_import com.badlogic.gdx.graphics.g3d.utils.ModelBuilder
java_import com.badlogic.gdx.graphics.g3d.Material
java_import com.badlogic.gdx.graphics.g3d.attributes.ColorAttribute
java_import com.badlogic.gdx.graphics.Color
java_import com.badlogic.gdx.graphics.VertexAttributes
java_import com.badlogic.gdx.graphics.g3d.ModelInstance
java_import com.badlogic.gdx.graphics.g3d.ModelBatch
java_import com.badlogic.gdx.graphics.g3d.Environment
java_import com.badlogic.gdx.graphics.g3d.environment.DirectionalLight
java_import com.badlogic.gdx.graphics.g3d.utils.CameraInputController
require_relative './color_builder'

class Game
  include ApplicationListener

  def create
    puts 'Starting MyGame'
    @fps_logger = FPSLogger.new

    @environment = init_environment
    @camera = init_camera
    @camera_controller = init_camera_controller

    @model_builder = ModelBuilder.new
    @model = model_builder.createBox(5.0, 5.0, 5.0, 
      Material.new(ColorAttribute.create_diffuse(ColorBuilder.from_int_rgb(224, 17, 95))),
      VertexAttributes::Usage::Position | VertexAttributes::Usage::Normal
    )
    @model_instance = ModelInstance.new @model

    @model_batch = ModelBatch.new
  end

  def render
    Gdx.gl.gl_viewport(0, 0, Gdx.graphics.width(), Gdx.graphics.height())
    r, g, b = ColorBuilder.rgb_from_hex '032D1D'
    Gdx.gl.gl_clear_color(r, g, b, 1)
    Gdx.gl.gl_clear(GL20::GL_COLOR_BUFFER_BIT | GL20.GL_DEPTH_BUFFER_BIT)

    model_batch.begin camera
    model_batch.render model_instance, environment
    model_batch.end

    fps_logger.log
  end

  def resize(width, height)
  end

  def pause
  end

  def resume
  end

  def dispose
    model_batch.dispose
    model.dispose
    puts 'Bye'
  end

  private

  attr_reader :fps_logger, :camera, :model, :model_builder, :model_batch, :model_instance, :environment

  def init_camera
    PerspectiveCamera.new(70, Gdx.graphics.width(), Gdx.graphics.height()).tap do |camera|
      camera.position.set(10.0, 10.0, 10.0)
      camera.look_at(0, 0, 0)
      camera.near = 1.0
      camera.far = 300.0
      camera.update
    end
  end

  def init_camera_controller
    CameraInputController.new(camera).tap { |controller| Gdx.input.setInputProcessor controller }
  end

  def init_environment
    Environment.new.tap do |env|
      env.set ColorAttribute.new(ColorAttribute::AmbientLight, 0.4, 0.4, 0.4, 1.0)
      env.add DirectionalLight.new.set(0.8, 0.8, 0.8, -1.0, -0.8, -0.2)
    end
  end
end
