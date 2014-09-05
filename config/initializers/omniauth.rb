Rails.application.config.middleware.use OmniAuth::Builder do
  provider :mapmyfitness, Rails.application.secrets.map_my_api_key, Rails.application.secrets.map_my_api_secret
#  provider :facebook, Rails.application.secrets.facebook_app_id, Rails.application.secrets.facebook_secret
#  provider :twitter, Rails.application.secrets.twitter_key, Rails.application.secrets.twitter_secret
end