# hisrc-rails

Retina displays are coming! Be sure to make your Rails app ready today.

How? Well, there are a lot of different approaches: 
> http://css-tricks.com/which-responsive-images-solution-should-you-use/
> http://www.alistapart.com/articles/responsive-images-how-they-almost-worked-and-what-we-need/

The one I like the most is [HiSRC](https://github.com/teleject/hisrc). This gem makes your live easier through two steps:

* It adds HiSRC to the Rails asset pipeline – no more messing around with javascript files.
* It provides a helper method to easy include HiSRC in your Rails views.

## Installation

In your `Gemfile`:

```ruby
gem 'hisrc-rails'
```

In your `application.js`:

```js
//= require hisrc

$(function() {
  $('img').hisrc();
});
```

For detailed information about available configuration options be sure to checkout the [HiSRC readme](https://github.com/teleject/hisrc#setting-up).

## Usage

`hisrc-rails` provides a nice little helper method to optimize your views: `responsive_image_tag`

`responsive_image_tag` accepts the same options as +image_tag+, and two additional options as well:

* <tt>:'1x'</tt> - If no 1x option is provided, the +src+ is used.
* <tt>:'2x'</tt> - If no 2x options is provided, "@2x" is added to the +src+. So "rails.png" becomes "rails@2x.png".

## Examples
```ruby
responsive_image_tag("rails.png")
  # => <img src="/assets/rails.png" data-1x="/assets/rails.png" data-2x="/assets/rails@2x.png" />

responsive_image_tag("http://placehold.it/100x100", :'1x' => "http://placehold.it/200x200", :'2x' => "http://placehold.it/400x400")
  # => <img src="http://placehold.it/100x100" data-1x="http://placehold.it/200x200" data-2x="http://placehold.it/200x200" />
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Acknowledgements
Many thanks to @1Mark for his first version of HiSRC, and to @teleject for maintaining the current version of this really great jQuery plugin. :)

## Copyright

(The MIT license)

Copyright (c) 2012 Mario Uher

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.