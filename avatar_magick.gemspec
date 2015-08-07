# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'avatar_magick/version'

Gem::Specification.new do |spec|
  spec.name          = "avatar_magick"
  spec.version       = AvatarMagick::VERSION
  spec.authors       = ["Bart Jedrocha"]
  spec.email         = ["bart.jedrocha@gmail.com"]

  spec.summary       = %q{A Dragonfly Plugin for generating on-the-fly Gmail style avatars}
  spec.homepage      = "https://github.com/bjedrocha/avatar_magick"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.9"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.3"

  spec.add_dependency "dragonfly", "~> 1.0"
end
