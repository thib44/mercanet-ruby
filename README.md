# Mercanet

A Ruby connector to the Mercanet API.

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

Then create two methods in controller (wich correspond to your response_url) to treate the mercanet response who can look like that :
```ruby
def mercanet_response_automatic
    response = Mercanet::Response.new(params)
    @sale = current_user.sales.find_by(payment_reference: response.hash_data['transaction_reference'])
    @sale.update!(mercanet_response: response.hash_data)
    if response.is_valid?
      @sale.validate!
    else
      @sale.refuse!
    end
  end

  def mercanet_response_manual
    response = Mercanet::Response.new(params)
    @sale = Sale.find_by(payment_reference: response.hash_data['transaction_reference'])
    @sale.update!(mercanet_response: response.hash_data)
    if response.is_valid?
      @sale.validate!
    else
      @sale.refuse!
    end
    redirect_to root_path
  end
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thib44/mercanet-ruby.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
