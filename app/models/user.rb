class User < ApplicationRecord
    delegate :username, to: :identity

    # associations
    has_one :identity
end
