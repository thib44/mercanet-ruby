module Mercanet
  class Response
    attr_accessor :hash_data
    def initialize(params)
      data = params['Data'].split('|')
      @hash_data = {}
      data.each do |d|
        array = d.split('=')
        @hash_data[array.first.underscore] = array.last
      end
    end

    def is_valid?
      @hash_data['response_code'] == '00'
    end
  end
end
