java_import com.badlogic.gdx.graphics.Color

class ColorBuilder
  def self.from_int_rgb(r, g, b, a = 0)
    components = to_float [r, g, b, a]
    Color.new(*components)
  end

  def self.rgb_from_hex(color_string)
    int_components = color_string.chars.each_slice(2).map { |octets| octets.join.to_i(16) }
    to_float int_components
  end

  def self.to_float(components)
    components.map { |component| (1.0 / 255) * component }
  end
end