class ThemoviedbService
  def initialize
    @base_url = 'https://api.themoviedb.org/3'
    @api_key = 'e2e6c0526e3737f2381684d2fd63d354'
  end

  def search_movies(query)
    make_request('movie', query)
  end

  def search_tv_shows(query)
    make_request('tv', query)
  end

  def search_people(query)
    make_request('person', query)
  end

  def search_all(query)
    make_request('multi', query)
  end

  private

  def make_request(url, query)
    response = Excon.get("#{@base_url}/search/#{url}",
                         query: { api_key: @api_key,
                                  query: query })

    JSON.parse(response.body)['results']
  end
end
