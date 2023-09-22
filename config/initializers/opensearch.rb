# # config/initializers/opensearch.rb

# require 'elasticsearch'

# # Define the Elasticsearch client with connection settings
# Elasticsearch::Model.client = Elasticsearch::Client.new(
#   hosts: [
#     { host: 'your-opensearch-host', port: 9200 } # Replace with your OpenSearch cluster's host and port
#   ],
#   # Add any additional configuration options as needed
# )


# config/initializers/opensearch.rb

# require 'opensearch'



# # config/initializers/opensearch.rb

# require 'opensearch'

# OpenSearch::Client.new(
#   endpoint: 'http://localhost:9200', # Replace with your OpenSearch endpoint
#   transport_options: {
#     request: { timeout: 5 } # Adjust timeout settings as needed
#   }
# )
