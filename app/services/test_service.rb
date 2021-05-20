class TestService
  def initialize
    url = 'https://us-central1-js-capstone-backend.cloudfunctions.net'
    @path = '/api/games/N9E2TejbOkDiI58nb6Vu/scores/'
    @headers = { content_type: :json, accept: :json }
    @site = RestClient::Resource.new url
  end

  def get_response
    JSON.parse(@site[@path].get @headers)
  end
end