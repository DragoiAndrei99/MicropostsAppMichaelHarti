# config/initializers/devise.rb

Devise.setup do |config|
  # ==> JWT integration
  require 'devise/jwt'

  # The secret key used by Devise. Devise uses this key to generate
  # random tokens. Changing this key will render invalid all existing
  # confirmation, reset password and unlock tokens in the database.
  # You can use `rake secret` to generate a secure secret key.
  config.secret_key = Rails.application.credentials.jwt_secret_key


  # ==> Mailer Configuration
  config.mailer_sender = 'please-change-me@example.com'

  # Load and configure the ORM. Supports :active_record (default) and
  # :mongoid (bson_ext recommended) by default.
  require 'devise/orm/active_record'

  # ==> JWT settings
  config.jwt do |jwt|
    jwt.secret = Rails.application.credentials.jwt_secret_key
    jwt.dispatch_requests = [
      ['POST', %r{^/auth_accounts/sign_in$}]
    ]
    jwt.revocation_requests = [
      ['DELETE', %r{^/auth_accounts/sign_out$}]
    ]
    jwt.expiration_time = 1.day.to_i
    jwt.request_formats = {
      auth_account: [:json]
    }
  end


  # ==> Authentication config
  config.navigational_formats = []

  # ==> Configuration for any authentication mechanism
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]

  # ==> OmniAuth
  # Add a new OmniAuth provider. Check the wiki for more information on setting
  # up on your models and hooks.
  # config.omniauth :github, 'APP_ID', 'APP_SECRET', scope: 'user,public_repo'

  # ==> Warden configuration
  # If using devise-jwt with multiple Devise models, consider using this setting:
  # config.warden do |manager|
  #   manager.failure_app = CustomFailure
  # end

  # ==> Configuration for :recoverable
  # config.reset_password_within = 6.hours

  # ==> Configuration for :confirmable
  # config.reconfirmable = true

  # ==> Scopes configuration
  # config.default_scope = :user
  # config.scoped_views = false

  # ==> Sign out configuration
  config.sign_out_via = :delete
end
