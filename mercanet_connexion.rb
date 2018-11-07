require 'uri'
require 'net/http'
require 'net/https'
require 'json'
require 'base64'
require 'byebug'
require 'active_support/core_ext/hash'

data = { amount: '1000',
  transactionReference: rand(1000..1000000000),
  currencyCode: 978,
  interfaceVersion: "IR_WS_2.20",
  merchantId: '211000021310001',
  normalReturnUrl: 'https://responseurl2.com',
  orderChannel: 'INTERNET',
  keyVersion: 1,
 }

data_to_seal = data.except(:keyVersion)
concatenate = data_to_seal.sort.to_h.values.join

key = "S9i8qClCnb2CZU3y3Vn0toIOgz3z_aBi79akR30vM9o"
seal = OpenSSL::HMAC.hexdigest('SHA256', key, concatenate)
data[:seal] = seal
# Work !!!!

uri = URI('https://payment-webinit-mercanet.test.sips-atos.com/rs-services/v2/paymentInit')
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
req = Net::HTTP::Post.new(uri.path, initheader = {'Content-Type' => 'application/json'})
http.verify_mode = OpenSSL::SSL::VERIFY_NONE
req.body = data.to_json
response = http.request(req)
puts response.body
