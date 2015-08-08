require 'spec_helper'

describe AvatarMagick::Generators::InitialAvatar do
  let(:generator) { AvatarMagick::Generators::InitialAvatar.new }
  let(:app) { test_avatar_magick_app }
  let(:image) { Dragonfly::Content.new(app) }

  describe "creating a default initial avatar" do
    before(:each) do
      generator.call(image, "Bart Jedrocha")
    end

    it { expect(image).to have_width(120) }
    it { expect(image).to have_height(120) }
    it { expect(image).to have_format('png') }

    it "should have proper metadata" do
      expect(image.meta).to eq({'format' => 'png', 'name' => 'avatar.png'})
    end
  end

  describe "setting a size" do
    describe "setting width and height" do
      before(:each) do
        generator.call(image, "Bart Jedrocha", { size: '240x200' })
      end

      it { expect(image).to have_width(240) }
      it { expect(image).to have_height(200) }
    end

    describe "setting width only" do
      before(:each) do
        generator.call(image, "Bart Jedrocha", { size: '180' })
      end

      it { expect(image).to have_width(180) }
      it { expect(image).to have_height(180) }
    end
  end

  describe "setting a format" do
    before(:each) do
      generator.call(image, "Bart Jedrocha", { format: 'gif' })
    end

    it { expect(image).to have_format('gif') }

    it "should have proper metadata" do
      expect(image.meta).to eq({'format' => 'gif', 'name' => 'avatar.gif'})
    end
  end
end