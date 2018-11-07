require "mercanet/version"
require "mercanet/payment"
require "mercanet/configuration"
require "byebug"

module Mercanet
  def self.configuration
    @configuration = Mercanet::Configuration.new
  end

  def self.url
    configuration.url
  end

  def self.interface_version
    configuration.interface_version
  end

  def self.merchant_id
    configuration.merchant_id
  end

  def self.secret_key

  end

  def self.key_version
    configuration.key_version
  end

  def self.automatic_response_url
    configuration.automatic_response_url
  end

  def self.normal_return_url
    configuration.normal_return_url
  end
end
