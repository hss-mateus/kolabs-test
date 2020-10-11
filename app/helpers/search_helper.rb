module SearchHelper
  # Generate a single pagination item based on it's active state
  def pagination_item(text, page, active = false)
    if active
      content = tag.span(text, class: 'page-link') if active
    else
      content = link_to(text, params.permit(:q, :filter, :page).merge(page: page), class: 'page-link')
    end

    tag.li(content, class: 'page-item' + (active ? ' active' : ''))
  end
end
