require 'just_giving'

JustGiving::Configuration.application_id = Rails.application.secrets.just_giving_app_id
JustGiving::Configuration.ca_path = "/System/Library/OpenSSL/certs" # (defaults to "/usr/lib/ssl/certs")
JustGiving::Configuration.environment = :sandbox
JustGiving::Configuration.username = Rails.application.secrets.just_giving_username
JustGiving::Configuration.password = Rails.application.secrets.just_giving_password