class Identity < OmniAuth::Identity::Models::ActiveRecord
  auth_key :username
  belongs_to :user

  def self.find_from_auth_hash(auth)
    find_by_provider_and_id(auth["provider"], auth["uid"])
  end
end
