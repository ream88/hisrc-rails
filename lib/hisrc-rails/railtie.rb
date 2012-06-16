module HisrcRails
  class Railtie < Rails::Railtie
    initializer 'hisrc-rails.initialize' do
      ActiveSupport.on_load :action_view do
        require 'hisrc-rails/responsive_image_tag_helper'
        include HisrcRails::ResponsiveImageTagHelper
      end
    end
  end
end
