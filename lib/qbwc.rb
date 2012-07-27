$:.unshift File.dirname(File.expand_path(__FILE__))
require 'quickbooks'

require 'qbwc/soap_wrapper/default'
require 'qbwc/soap_wrapper/defaultMappingRegistry'
require 'qbwc/soap_wrapper/QBWebConnectorSvc'
require 'qbwc/soap_wrapper'
require 'qbwc/config'

module QBWC

  # Allow configuration overrides
  class << self
    def configure
      yield Config
    end

    def parser
      @parser ||= Quickbooks::API[Config.api]
    end
  end
end
