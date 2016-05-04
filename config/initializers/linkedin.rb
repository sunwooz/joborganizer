LinkedIn.configure do |config|
  config.token = Rails.application.secrets.client_key
  config.secret = Rails.application.secrets.client_secret
end