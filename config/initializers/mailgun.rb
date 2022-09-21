Mailgun.configure do |config|
    config.api_key = Rails.application.credentials.MAILGUN_KEY
end