# VCR.configure do |config|
#   config.cassette_library_dir = 'spec/support/vcr_cassettes'
#   config.hook_into :webmock
#   config.configure_rspec_metadata!
#   config.allow_http_connections_when_no_cassette = true
#   config.ignore_hosts 'chromedriver.storage.googleapis.com'

#   config.default_cassette_options = {
#     record: :new_episodes,
#     allow_playback_repeats: true,
#     :match_requests_on => [:method,
#       VCR.request_matchers.uri_without_param(:url)]
#     }

#   %w[
#     authorize_api_url
#     api_base_url
#   ].each do |key|
#     config.filter_sensitive_data("<#{key}>") { Rails.application.credentials[Rails.env.to_sym][:nuvemshop][key.to_sym] }
#   end
# end