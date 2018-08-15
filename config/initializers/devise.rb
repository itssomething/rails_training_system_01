Devise.setup do |config|
  config.secret_key = '607f4ff2a315e940d491080db4eb0109509c18baf1505f81350aa704cf8f1f42c04bdf49ecdae926bf28fca87208d5a5e8eb1880e5f118280ee7094244fdbc95'
  
  config.mailer_sender = 'please-change-me-at-config-initializers-devise@example.com'

  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete
end
