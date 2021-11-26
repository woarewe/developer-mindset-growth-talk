# Bad

class SyncService
  def perform(params)
    # does some logic
    HTTP::Client.new.post('/data', params.fetch(:data))
  end
end

# Good

class SyncService
  attr_reader :http_client

  def initiailze(http_client:  HTTP::Client.new)
    @http_client = http_client
  end

  def perform(params)
    # does some logic
    http_client.post('/data', params.fetch(:data))
  end
end