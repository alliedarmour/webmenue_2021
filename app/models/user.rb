class User < ApplicationRecord
    delegate :username, to: :identity
    has_one :identity
    has_many :order_cards
end
