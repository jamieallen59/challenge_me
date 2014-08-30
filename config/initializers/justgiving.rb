require 'just_giving'

JustGiving::Configuration.application_id = "d3a7b8b5"

JustGiving::Configuration.ca_path = "/System/Library/OpenSSL/certs" # (defaults to "/usr/lib/ssl/certs")

JustGiving::Configuration.environment = :production

JustGiving::Configuration.username = 'toan' # Needed for actions that require auth

JustGiving::Configuration.password = 'wcXubDLD9GY8QfDkvaobfwL' # Needed for actions that require auth

response = JustGiving::Fundraising.new('ngaiosimpson')
puts response.inspect