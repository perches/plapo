require File.expand_path('lib/omniauth/strategies/doorkeeper', Rails.root)
Rails.application.config.middleware.use OmniAuth::Builder do
   OAUTH_CONFIG = YAML.load_file("#{Rails.root}/config/omniauth.yml")[Rails.env].symbolize_keys!
#    provider :doorkeeper, OAUTH_CONFIG[:doorkeeper]['key'], OAUTH_CONFIG[:doorkeeper]['secret']

#    provider :google_oauth2, OAUTH_CONFIG[:google]['key'], OAUTH_CONFIG[:google]['secret'], name: :google, scope: %w(email)

   provider :twitter,
   OAUTH_CONFIG[:twitter]['key'],
   OAUTH_CONFIG[:twitter]['secret']

end