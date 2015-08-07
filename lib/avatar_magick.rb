require "dragonfly"
require "avatar_magick/version"
require "avatar_magick/plugin"

Dragonfly::App.register_plugin(:avatar_magick){ AvatarMagick::Plugin.new }