require File.expand_path('../spec_helper', __FILE__)
require 'hisrc-rails/responsive_image_tag_helper'

describe HisrcRails::ResponsiveImageTagHelper do
  let(:mock) do
    Class.new(MiniTest::Mock) do
      include HisrcRails::ResponsiveImageTagHelper
      
      def path_to_image(_) _ end
    end.new
  end

  def data(_1x, _2x)
    { data: { :'1x' => _1x, :'2x' => _2x }}
  end


  describe :responsive_image_tag do
    it 'sets the data-1x and data-2x attributes' do
      mock.expect(:image_tag, nil, ['rails.png', data('rails.png', 'rails@2x.png')])
      
      mock.responsive_image_tag('rails.png')
      mock.verify
    end


    it 'accepts a long +src+ path too' do
      mock.expect(:image_tag, nil, ['long/path/to/image.png', data('long/path/to/image.png', 'long/path/to/image@2x.png')])
      
      mock.responsive_image_tag('long/path/to/image.png')
      mock.verify
    end


    it 'allows to explicity set the +x+ option' do
      mock.expect(:image_tag, nil, ['http://placehold.it/100x100', data('http://placehold.it/200x200', 'http://placehold.it/400x400')])
      
      mock.responsive_image_tag("http://placehold.it/100x100", :'1x' => "http://placehold.it/200x200", :'2x' => "http://placehold.it/400x400")
      mock.verify
    end


    it 'allows to explicity set the +data+ hash' do
      mock.expect(:image_tag, nil, ['http://placehold.it/100x100', data('http://placehold.it/200x200', 'http://placehold.it/400x400')])
      
      mock.responsive_image_tag("http://placehold.it/100x100", data: { :'1x' => "http://placehold.it/200x200", :'2x' => "http://placehold.it/400x400" })
      mock.verify
    end
  end
end
