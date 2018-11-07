module Mercanet
  class Configuration
    attr_accessor :url,
                  :merchant_id,
                  :secret_key,
                  :key_version,
                  :interface_version,
                  :automatic_response_url,
                  :normal_return_url
    def initialize(url = nil, merchant_id = nil, secret_key = nil, key_version = nil, interface_version = nil, automatic_response_url = nil, normal_return_url = nil)
      @url = url || "https://payment-webinit-mercanet.test.sips-atos.com"
      @merchant_id = merchant_id || "211000021310001"
      @secret_key = secret_key || "S9i8qClCnb2CZU3y3Vn0toIOgz3z_aBi79akR30vM9o"
      @key_version = key_version || 1
      @interface_version = interface_version || "IR_WS_2.20"
      @automatic_response_url = automatic_response_url || 'http://localhost:3000'
      @normal_return_url = normal_return_url || 'https://responseurl2.com'
    end
  end
end
