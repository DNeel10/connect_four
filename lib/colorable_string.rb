# frozen_string_literal: true

module ColorableString
  RGB_COLOR_MAP = {
    red: "255;85;85",
    black: "0;0;0"
  }.freeze

  refine String do
    def fg_color(color_name)
      rgb_val = RGB_COLOR_MAP[color_name]
      "\e[38;2;#{rgb_val}m#{self}\e[0m"
    end
  end
end
