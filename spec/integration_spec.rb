require_relative 'spec_helper'
require 'rails/railtie'
require 'hisrc-rails/railtie'
require 'action_controller/railtie'

class App < Rails::Application
  config.eager_load = true
  initialize!
end

describe ActionView::Base do
  it 'haz method' do
    ActionView::Base.instance_methods.must_include :responsive_image_tag
  end
end


describe ActionController::Base do
  it 'haz helper' do
    ActionController::Base.helpers.methods.must_include :responsive_image_tag
  end
end
