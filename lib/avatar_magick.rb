require "dragonfly"
require "avatar_magick/version"
require "avatar_magick/plugin"

# registers AvatarMagick as a plugin using both notations to remain consistent
# with the ImageMagick plugin
Dragonfly::App.register_plugin(:avatar_magick) { AvatarMagick::Plugin.new }
Dragonfly::App.register_plugin(:avatarmagick) { AvatarMagick::Plugin.new }