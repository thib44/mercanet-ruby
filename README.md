# Mercanet

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/mercanet`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

The full documentation of mercanet : https://documentation.mercanet.bnpparibas.net
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mercanet'
# need for the post reception from mercanet api
gem 'rack-cors', require: 'rack/cors'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mercanet

## Usage
Create a Mercanet Initializer with :
```ruby
# the value is the test value of mercanet, use your personnal value from mercanet and use rails credentials
Mercanet.config do |m|
  m.url = "https://payment-webinit-mercanet.test.sips-atos.com"
  m.merchant_id = "211000021310001"
  m.secret_key = "S9i8qClCnb2CZU3y3Vn0toIOgz3z_aBi79akR30vM9o"
  m.key_version = 1
  m.interface_version = "IR_WS_2.20"
  m.automatic_response_url = 'http://localhost:3000'
  m.normal_return_url = 'http://localhost:3000'
end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mercanet.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
