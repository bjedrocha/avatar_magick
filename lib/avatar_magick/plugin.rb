require "avatar_magick/generators/initial_avatar"

module AvatarMagick

  # Registers the initial_avatar generator
  class Plugin
    def call(app, opts={})

      # set global configuration options
      app.env[:avatar_magick] = {}
      app.env[:avatar_magick][:color]             = opts[:color] ? "##{opts[:color]}" : "#FFFFFF"
      app.env[:avatar_magick][:background_color]  = opts[:background_color] ? "##{opts[:background_color]}" : "#000000"
      app.env[:avatar_magick][:size]              = opts[:size] || "120x120"
      app.env[:avatar_magick][:font]              = opts[:font] || "Arial-Regular"
      app.env[:avatar_magick][:font_size]         = opts[:font_size]

      app.add_generator :initial_avatar, AvatarMagick::Generators::InitialAvatar.new
    end
  end
end