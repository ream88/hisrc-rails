require 'rails/railtie'
require 'rails/engine'

module HisrcRails
  class Railtie < Rails::Railtie
    initializer 'hisrc-rails.initialize' do
      ActiveSupport.on_load :action_view do
        require 'hisrc-rails/responsive_image_tag_helper'
        include HisrcRails::ResponsiveImageTagHelper
      end
    end
  end

  class Engine < ::Rails::Engine; end
end
