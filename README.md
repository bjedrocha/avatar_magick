## Overview

AvatarMagick is a [Dragonfly](https://github.com/markevans/dragonfly) plugin for generating Gmail style avatars like those pictured below

<p align="center">
	<img src="https://dl.dropboxusercontent.com/u/362501/avatarmagic-github-readme.png" alt="sample">
</p>

The plugin is configurable and options can be set to control background color, text color, font, and size.

#### Dragonfly compatibility

The plugin works with the latest versions (1.x) of Dragonfly with support for older versions (0.9.x) in the pipeline.

## Installation

It is assumed you're already using Dragonfly. To install AvatarMagick, simply add this line to your application's Gemfile:

```ruby
gem 'avatar_magick'
```

And then execute:

    $ bundle
    
Once installed, you'll need to register the AvatarMagick plugin along with the [ImageMagick](http://markevans.github.io/dragonfly/imagemagick/) plugin that's included with the Dragonfly gem.

#### Rails

If you're using Dragonfly within your Rails application, you'll already have a `config/initializers/dragonfly.rb` file where your Dragonfly configuration settings are stored. Edit the file and add the following directly below the `plugin :imagemagick` line

```ruby
plugin :avatarmagick
```

#### Sinatra/Rack/Other

Simply add the plugin within the `configure` block

```ruby
require 'dragonfly'

Dragonfly.app.configure do
  plugin :imagemagick
  plugin :avatarmagick
end
```

## Usage

Once the plugin is installed and registered, you can use it like any of the other built-in generators (text, plain, etc.)

#### Basic

```ruby
image = Dragonfly.app.generate(:initial_avatar, "Bart Jedrocha")
```

will produce

![basic](https://dl.dropboxusercontent.com/u/362501/avatarmagick-readme-basic.png)

The plugin will extract at most 3 initials from the passed-in string (e.g. Bill James Pheonix MacKenzie will produce an avatar with the initials BJP). This should be sufficient for the vast majority of cases.

#### Playing with options

You can pass options to control the background color, text color, size, and font used to generate the avatar

```ruby
Dragonfly.app.generate(:initial_avatar, "Martin", {background_color: 'ff8f00'})
```

will produce

![bgcolor](https://dl.dropboxusercontent.com/u/362501/avatarmagick-readme-bgcolor.png)

```ruby
Dragonfly.app.generate(:initial_avatar, "James Hetfield", {background_color: 'f48fb1', color: '333333'})
```

will produce

![txtcolor](https://dl.dropboxusercontent.com/u/362501/avatarmagick-readme-textcolor.png)

```ruby
Dragonfly.app.generate(:initial_avatar, "Amanda Smith", {background_color: '00695c', size: '200'})
```

will produce

![size](https://dl.dropboxusercontent.com/u/362501/avatarmagick-readme-size.png)

```ruby
Dragonfly.app.generate(:initial_avatar, "Oliver Murphy", {background_color: 'b71c1c', font: 'Georgia'})
```

will produce

![font](https://dl.dropboxusercontent.com/u/362501/avatarmagick-readme-font.png)

## Development

After checking out the repo, run `bash bin/setup` to install dependencies. Then, run `ruby bin/console` for an interactive prompt that will allow you to experiment. Please note that before being able to use the generator, you'll need to register both the [ImageMagick](http://markevans.github.io/dragonfly/imagemagick/) plugin and the AvatarMagic plugin

	irb > Dragonfly.app.configure do
	irb >   plugin :imagemagick
	irb >   plugin :avatarmagick
	irb > end

To install this gem onto your local machine, run `bundle exec rake install`.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/avatar_magick/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
