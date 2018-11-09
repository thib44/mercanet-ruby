require "mercanet/version"
require "mercanet/payment"
require "byebug"

module Mercanet
  class << self
    attr_accessor :url, :interface_version, :merchant_id, :secret_key, :key_version, :automatic_response_url, :normal_return_url

    def config(&block)
      yield(self)
    end
  end
end
