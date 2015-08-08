$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'dragonfly'
require 'avatar_magick'

# Requires supporting files with custom matchers and macros, etc,
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

RSpec.configure do |c|
  c.after(:each) do
    Dragonfly::App.destroy_apps
  end
end

def test_app(name=nil)
  app = Dragonfly::App.instance(name)
  app.datastore = Dragonfly::MemoryDataStore.new
  app.secret = "test secret"
  app
end

def test_avatar_magick_app
  test_app.configure do
    generator :convert, Dragonfly::ImageMagick::Generators::Convert.new
    processor :convert, Dragonfly::ImageMagick::Processors::Convert.new
    plugin :avatarmagick
  end
end