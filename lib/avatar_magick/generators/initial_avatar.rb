require "dragonfly/hash_with_css_style_keys"

module AvatarMagick
  module Generators
    class InitialAvatar
      def call(content, string, opts={})
        opts = ::Dragonfly::HashWithCssStyleKeys[opts]
        args = []

        # defaults
        format = opts[:format] || :png
        background = opts[:background_color] ? "##{opts[:background_color]}" : '#000000'
        color = opts[:color] ? "##{opts[:color]}" : '#FFFFFF'
        size = opts[:size] || '120x120'
        font = opts[:font] || 'Arial-Regular'

        text = (string.split(/\s/)- ["", nil]).map { |t| t[0].upcase }.slice(0, 3).join('')

        w, h = size.split('x').map { |d| d.to_i }
        h ||= w

        font_size = ( w / [text.length, 2].max ).to_i

        # Settings
        args.push("-gravity Center")
        args.push("-antialias")
        args.push("-pointsize #{font_size}")
        args.push("-font \"#{font}\"")
        args.push("-family '#{opts[:font_family]}'") if opts[:font_family]
        args.push("-fill #{color}")
        args.push("-background #{background}")
        args.push("label:#{text}")

        content.generate!(:convert, args.join(' '), format)

        args = args.slice(0, args.length - 2)
        args.push("-size #{w}x#{h}")
        args.push("xc:#{background}")
        args.push("-annotate 0x0 #{text}")

        content.generate!(:convert, args.join(' '), format)

        content.add_meta('format' => format, 'name' => "text.#{format}")
      end
    end
  end
end