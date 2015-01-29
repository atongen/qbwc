require 'soap/rpc/standaloneServer'

module QBWC
  class SoapWrapper
    include Singleton

    attr_reader :router, :conn_data

    def initialize
      @router = ::SOAP::RPC::Router.new('QBWebConnectorSvcSoap')
      @router.mapping_registry = DefaultMappingRegistry::EncodedRegistry
      @router.literal_mapping_registry = DefaultMappingRegistry::LiteralRegistry
      @conn_data = ::SOAP::StreamHandler::ConnectionData.new

      servant = Config.servant.new
      QBWebConnectorSvcSoap::Methods.each do |definitions|
        opt = definitions.last
        if opt[:request_style] == :document
          @router.add_document_operation(servant, *definitions)
        else
          @router.add_rpc_operation(servant, *definitions)
        end
      end
    end

    def self.route_request(request)
      instance.conn_data.receive_string = request.raw_post
      instance.conn_data.receive_contenttype = request.content_type
      instance.conn_data.soapaction = nil

      instance.router.external_ces = nil
      res_data = instance.router.route(instance.conn_data)

      # debugging
      result = res_data.send_string
      #puts result

      result
    end
  end
end
