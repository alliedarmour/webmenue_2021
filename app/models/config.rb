class Config < ApplicationRecord
  delegated_type :configurable, types: %w[LdapConfig ApplicationConfig]
end
