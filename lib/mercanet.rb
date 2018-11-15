require "mercanet/version"
require "mercanet/payment"
require "mercanet/response"

module Mercanet
  class << self
    attr_accessor :url, :interface_version, :merchant_id, :secret_key, :key_version, :automatic_response_url, :normal_return_url, :environment

    def config(&block)
      yield(self)
    end

    def development?
      %w(test development).include?(environment)
    end
  end
end
