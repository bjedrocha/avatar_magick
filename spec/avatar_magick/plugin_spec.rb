require 'spec_helper'

describe AvatarMagick::Plugin do
  let(:app) { test_app }
  
  describe 'configuration' do
    it 'should allow setting a color' do
      app.configure do
        plugin :avatarmagick, color: 'FF0000'
      end

      expect(app.env[:avatar_magick][:color]).to eq('#FF0000')
    end

    it 'should allow setting a background_color' do
      app.configure do
        plugin :avatarmagick, background_color: 'FFFF00'
      end

      expect(app.env[:avatar_magick][:background_color]).to eq('#FFFF00')
    end

    it 'should allow setting a size' do
      app.configure do
        plugin :avatarmagick, size: '180x180'
      end

      expect(app.env[:avatar_magick][:size]).to eq('180x180')
    end

    it 'should allow setting a font' do
      app.configure do
        plugin :avatarmagick, font: 'Georgia'
      end

      expect(app.env[:avatar_magick][:font]).to eq('Georgia')
    end
  end
end