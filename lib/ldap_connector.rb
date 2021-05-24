require "net/ldap"
require "singleton"

class LdapConnector
    include Singleton

    attr_reader :connection

    def initialize
        @connection = Net::LDAP.new(**LdapConfig.settings)
    end

    def authenticate_credentials(username:, password:)
        res = connection.bind_as(base: connection.base, filter: "(uid=#{username})", password: password)
    end
end