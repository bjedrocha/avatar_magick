require "dragonfly"
require "avatar_magick/version"
require "avatar_magick/plugin"

# Register plugins so we can do e.g.
# Dragonfly.app.configure do
#   plugin :avatarmagick
# end
Dragonfly::App.register_plugin(:avatar_magick) { AvatarMagick::Plugin.new }
Dragonfly::App.register_plugin(:avatarmagick) { AvatarMagick::Plugin.new }