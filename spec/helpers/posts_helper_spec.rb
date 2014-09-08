require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the PostsHelper. For example:
#
# describe PostsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe PostsHelper, :type => :helper do
  context '#time_line_image' do
    it 'should return a movie icon for video posts' do
      post = create(:video)
      expect(time_line_image(post)).to eq 'cd-icon-movie.svg'
    end

    it 'should return a image icon for a picture post' do
      post = create(:picture)
      expect(time_line_image(post)).to eq 'cd-icon-picture.svg'
    end

    it 'should return a location icon for any other post' do
      post = create(:post)
      expect(time_line_image(post)).to eq 'cd-icon-location.svg'
    end
  end

  context '#time_line_class' do
    it 'should return cd-movie for video posts' do
      post = create(:video)
      expect(time_line_class(post)).to eq 'cd-movie'
    end

    it 'should return cd-picture for a picture post' do
      post = create(:picture)
      expect(time_line_class(post)).to eq 'cd-picture'
    end

    it 'should return cd-location for any other post' do
      post = create(:post)
      expect(time_line_class(post)).to eq 'cd-location'
    end
  end
end
