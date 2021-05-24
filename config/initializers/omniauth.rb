Rails.application.config.middleware.use OmniAuth::Builder do
  provider :identity, 
    fields: [:username], 
    enable_registration: false,
    on_login: lambda { |env| SessionsController.action(:new).call(env) }
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}