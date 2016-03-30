# Info

[![Build Status](https://travis-ci.org/fnando/info.svg)](https://travis-ci.org/fnando/info)
[![Code Climate](https://codeclimate.com/github/fnando/info.png)](https://codeclimate.com/github/fnando/info)

Info a library that allows you collecting info about your application in a simple JSON endpoint.

![Info endpoint](https://raw.githubusercontent.com/fnando/info/master/screenshot.png)

## Installation

Just the following line to your Gemfile:

```ruby
gem "info"
```

Now, create a initializer at `config/initializers/info.rb` with the following content:

```ruby
Info.setup do
  enable!
end
```

Read more about authorization and how to add collectors below.

## Usage

To add your own collectors, just use the method `Info::Configuration#add`.

```ruby
Info.setup do
  add "Rails", Rails.version
end
```

You can also use `Info.add "Rails", Rails.version`.

Info comes with some default information; just load the `info/rails` file. You can do it on a initializer file (`config/initializers/info.rb`) or your Gemfile.

```ruby
gem "info", require: "info/rails"
```

All Rubygems that your app is using can be collected by loading the file `info/rubygems`.

You may need to clear all collectors; in this case just use `Info.collectors.clear`.

To view your collected info, just visit `/application/info`. This endpoint is public, so you can set authorization with two strategies: token and basic auth.

### Authorization

To authorize the endpoint access with basic authentication, just provide a block that requires two arguments.

```ruby
Info.setup do
  authorize {|email, password| AdminUser.find_by_email(email).authenticate(password) }
end
```

To authorize the endpoint access with token authentication, just provide a block that requires one argument.

```ruby
Info.setup do
  authorize {|token| AdminUser.find_by_token(token).present? }
end
```

You can also use `Info.authorize(&block)`.

## Maintainer

* Nando Vieira (<http://nandovieira.com>)

## License:

(The MIT License)

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
