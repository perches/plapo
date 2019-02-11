require File.expand_path('lib/omniauth/strategies/doorkeeper', Rails.root)
Rails.application.config.middleware.use OmniAuth::Builder do
   OAUTH_CONFIG = YAML.load_file("#{Rails.root}/config/omniauth.yml")[Rails.env].symbolize_keys!
   provider :twitter,
   ENV.fetch("TWITTER_CONSUMER_KEY"),
   ENV.fetch("TWITTER_CONSUMER_SECRET")
end

Rails.application.config.to_prepare do
   Devise::OmniauthCallbacksController.class_eval do
     def failure
       # 認証をキャンセルした場合
       # TODO: 認証キャンセルの場合にはトップ画面かどこかにリダイレクト
       render json: { message: "Login failed." }, status: 401
     end
   end
 end