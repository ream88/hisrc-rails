require 'active_support/core_ext/object/blank'

module HisrcRails
  module ResponsiveImageTagHelper
    # Returns a hisrc-ready html image tag for the +src+.
    # If not otherwise specified, it will add two data attributes
    # which are required for hisrc to work.
    #
    # ==== Options
    # +responsive_image_tag+ accepts the same options as +image_tag+,
    # and two additional options as well:
    #
    # * <tt>:'1x'</tt> - If no 1x option is provided, the +src+ is used.
    # * <tt>:'2x'</tt> - If no 2x options is provided, "@2x" is added to
    # the +src+. So "rails.png" becomes "rails@2x.png".
    #
    # ==== Examples
    #  responsive_image_tag("rails.png") # =>
    #    <img src="/assets/rails.png" data-1x="/assets/rails.png" data-2x="/assets/rails@2x.png" />
    #  responsive_image_tag("http://placehold.it/100x100", :'1x' => "http://placehold.it/200x200", :'2x' => "http://placehold.it/400x400") # =>
    #    <img src="http://placehold.it/100x100" data-1x="http://placehold.it/200x200" data-2x="http://placehold.it/200x200" />
    def responsive_image_tag(src, options = {})
      options = options.with_indifferent_access if options.is_a?(Hash)
      options[:data] ||= {}
      options[:data][:'1x'] ||= options.delete(:'1x').presence || path_to_image(src)
      options[:data][:'2x'] ||= options.delete(:'2x').presence || path_to_image(src.gsub(/([\w\/]+).(\w+)/, '\1@2x.\2'))
      
      image_tag(src, options)
    end
  end
end
