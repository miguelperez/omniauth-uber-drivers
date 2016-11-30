omniauth-uber-drivers
=====================

This is the omniauth strategy for the Uber Drivers API.

You may view the [Uber Drivers API documentation](https://developer.uber.com/docs/drivers/introduction).

## Installation

Add to your `Gemfile`:

```ruby
gem 'omniauth-uber-drivers'
```

Then `bundle install`.

## Usage

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :uber_drivers, ENV['UBER_CLIENT_ID'], ENV['UBER_CLIENT_SECRET']
end
```

Do not forget setting the scope. By default it is settup to `partner.accounts`.

From the docs:

> Scopes control the various API endpoints your application can access. When requesting an access token to use on behalf of a driver your application will specify which scopes it needs and these will be shown to the user during the OAuth flow. It’s best to limit the scopes you need to the bare minimum so that drivers can feel confident with your app and the amount of data it can access.

Available scopes: `partner.accounts`, `partner.payments`, `partner.trips`.  Default: `partner.accounts`

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :uber_drivers, ENV['UBER_CLIENT_ID'], ENV['UBER_CLIENT_SECRET'], :scope => 'partner.accounts,partner.payments'
end

```

## License

Copyright (c) 2016 by Miguel Perez

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
