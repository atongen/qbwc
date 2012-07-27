module QBWC
  class Config
    private_class_method :new

    class << self
      attr_accessor :servant
      @servant = QBWC::QBWebConnectorSvcSoap

      # Web connector login credentials
      attr_accessor :username
      attr_accessor :password

      # Full path to pompany file
      attr_accessor :company_file_path
      @company_file_path = ""

      # Minimum quickbooks version required for use in qbxml requests
      attr_accessor :min_version
      @min_version = 3.0

      # Quickbooks support url provided in qwc file
      attr_accessor :support_site_url
      @support_site_url = 'http://qb_support.lumber.com'

      # Quickbooks owner id provided in qwc file
      attr_accessor :owner_id
      @owner_id = '{57F3B9B1-86F1-4fcc-B1EE-566DE1813D20}'

      # Quickbooks Type (either :qb or :qbpos)
      attr_accessor :api
      @api = :qb
    end

  end
end