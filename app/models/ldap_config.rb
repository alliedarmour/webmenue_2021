class LdapConfig < ApplicationRecord
    has_one :config, as: :configurable

    def self.settings
        {
            host: first.host,
            port: first.port,
            base: first.base,
            auth: {
                method: :simple,
                username: first.username,
                password: first.password
            }
        }
    end 
end
