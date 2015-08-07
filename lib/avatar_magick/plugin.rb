require "avatar_magick/generators/initial_avatar"

module AvatarMagick

  # Registers the initial_avatar generator
  class Plugin
    def call(app, opts={})
      app.add_generator :initial_avatar, AvatarMagick::Generators::InitialAvatar.new
    end
  end
end