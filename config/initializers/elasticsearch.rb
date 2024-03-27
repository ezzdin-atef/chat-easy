Elasticsearch::Model.client = Elasticsearch::Client.new(url: 'http://elasticsearch:9200', retry_on_failure: 5)
