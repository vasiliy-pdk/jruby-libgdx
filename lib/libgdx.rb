%w[
  gdx
  gdx-backend-lwjgl
  gdx-backend-lwjgl-natives
  gdx-natives
].each { |dependency| require_relative "./libgdx/#{dependency}.jar" }

java_import com.badlogic.gdx.backends.lwjgl.LwjglApplication
java_import com.badlogic.gdx.backends.lwjgl.LwjglApplicationConfiguration
java_import com.badlogic.gdx.Gdx
java_import com.badlogic.gdx.ApplicationListener
java_import com.badlogic.gdx.graphics.FPSLogger