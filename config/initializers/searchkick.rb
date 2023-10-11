# frozen_string_literal: true
# # config/initializers/searchkick.rb

# require 'elasticsearch'

# # Replace 'your-opensearch-host' and 'your-opensearch-port' with your OpenSearch cluster's host and port
# Searchkick.client = Elasticsearch::Client.new(
#   hosts: [
#     { host: 'http://localhost:9200/', port: 9200 }
#   ]
# )

# # Optional: Adjust any other Searchkick configuration settings here
# # Searchkick.client = Elasticsearch::Client.new(
# #   hosts: [
# #     { host: 'your-opensearch-host', port: your-opensearch-port }
# #   ],
# #   log: true, # Enable logging for debugging (optional)
# #   retry_on_failure: true, # Enable automatic retries (optional)
# #   transport_options: {
# #     request: { timeout: 5 } # Adjust timeout settings as needed (optional)
# #   }
# # )
