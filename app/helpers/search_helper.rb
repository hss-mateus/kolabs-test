module SearchHelper
  # Generate a single pagination item based on it's active state
  def pagination_item(text, page, active = false)
    if active
      content = tag.span(text, class: 'page-link')
      classes = 'page-item active'
    else
      content = link_to(text, params.permit(:q, :filter, :page).merge(page: page), class: 'page-link')
      classes = 'page-item'
    end

    tag.li(content, class: classes)
  end

  # Makes a new sanitized hash with result data
  def make_result(result)
    date = result['release_date'] || result['first_air_date']
    image = result['poster_path'] || result['backdrop_path'] || result['profile_path']

    { id: result['id'],
      img_url: image_url(image),
      date: date && Time.new(date).strftime('%b %d, %Y'),
      name: result['title'] || result['name'],
      overview: result['overview'],
      media_type: result['media_type'],
      vote_average: result['vote_average'] || 'N/A' }
  end
end
