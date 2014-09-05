<<<<<<< HEAD
require 'oauth2'

client = OAuth2::Client.new('client_id', 'client_secret', :site => 'https://example.org')

auth_url = client.auth_code.authorize_url(:redirect_uri => 'http://localhost:8080/oauth/callback')
token = client.auth_code.get_token('code_value', :redirect_uri => 'http://localhost:8080/oauth/callback')

auth_url = client.implicit.authorize_url(:redirect_uri => 'http://localhost:8080/oauth/callback')
# get the token params in the callback and
token = OAuth2::AccessToken.from_kvform(client, query_string)

token = client.password.get_token('username', 'password')

token = client.client_credentials.get_token

token = client.assertion.get_token(assertion_params)
=======
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :mapmyfitness, Rails.application.secrets.map_my_api_key, Rails.application.secrets.map_my_api_secret
#  provider :facebook, Rails.application.secrets.facebook_app_id, Rails.application.secrets.facebook_secret
#  provider :twitter, Rails.application.secrets.twitter_key, Rails.application.secrets.twitter_secret
end
>>>>>>> 57deae8f42fe0803a2dd91799c7d514e2b39468c
