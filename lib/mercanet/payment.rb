module Mercanet
  class Payment
    require 'uri'
    require 'net/http'
    require 'net/https'
    require 'json'
    require 'base64'
    require 'active_support/core_ext/hash'

    # currency_code Euro = 978
    # order_channel Internet = INTERNET
    def self.new_payment(amount, currency_code, order_channel, transaction_reference)
      config = Mercanet.configuration
      data = { amount: amount,
              automaticResponseUrl: config.automatic_response_url,
              currencyCode: currency_code,
              interfaceVersion: config.interface_version,
              keyVersion: config.key_version,
              merchantId: config.merchant_id,
              normalReturnUrl: config.normal_return_url,
              orderChannel: order_channel,
              transactionReference: transaction_reference
            }

      data_to_seal = data.except(:keyVersion)
      concatenate = data_to_seal.sort.to_h.values.join
      key = config.secret_key
      seal = OpenSSL::HMAC.hexdigest('SHA256', key, concatenate)
      data[:seal] = seal

      uri = URI("#{config.url}/rs-services/v2/paymentInit")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      req = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' => 'application/json'})
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      req.body = data.to_json
      response = http.request(req)
      JSON.parse(response.body)
    end
  end
end
