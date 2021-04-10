module OmniauthTestHelper
    def setup_valid_auth_hash
        if Rails.env.test?
            OmniAuth.config.test_mode = true
            OmniAuth.config.mock_auth[:identity] = OmniAuth::AuthHash.new({
                provider: "identity",
                uid: "2"
            })
        end
    end

    def setup_invalid_auth_hash
        if Rails.env.test?
            OmniAuth.config.test_mode = true
            OmniAuth.config.mock_auth[:identity] = :invalid_credentails
        end
    end
end