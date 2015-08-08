require 'spec_helper'

describe AvatarMagick do
  let(:app) { test_app }

  it 'can be registered as :avatar_magick' do
    app.configure do
      plugin :avatar_magick
    end

    expect(app.plugins).to include(:avatar_magick)
  end

  it 'can be registered as :avatarmagick' do
    app.configure do
      plugin :avatarmagick
    end

    expect(app.plugins).to include(:avatarmagick)
  end
end
