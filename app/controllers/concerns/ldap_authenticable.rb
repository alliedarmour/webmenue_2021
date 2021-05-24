module LdapAuthenticable 
    extend ActiveSupport::Concern

    def find_or_create_identity(result)
        identity = Identity.find_or_initialize_by(username: result.uid.first)
        if identity.persisted?
            identity.user.update({
                first_name: result.cn[0].split[0..-2].join(" "),
                last_name: result.sn.first
            })
        else
            identity.password = SecureRandom.hex(8)
            identity.build_user(
                first_name: result.cn[0].split[0..-2].join(" "),
                last_name: result.sn.first
            )
            identity.save
        end
        return identity
    end
end