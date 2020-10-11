class ThemoviedbService
  def initialize
    @base_url = 'https://api.themoviedb.org/3'
    @api_key = 'e2e6c0526e3737f2381684d2fd63d354'
  end

  def search(query, type = 'multi', page = 1)
    type = %w[movie tv person].include?(type) ? type : 'multi'

    make_request(query, type, page)
  end

  private

  def make_request(query, type, page)
    response = Excon.get("#{@base_url}/search/#{type}",
                         query: { api_key: @api_key,
                                  query: query,
                                  page: page })

    body = JSON.parse response.body

    { total_pages: body['total_pages'],
      results: body['results'] }
  end
end
