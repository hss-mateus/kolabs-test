class Movie < ApplicationRecord
  validates :title,
    :release_date,
    :description,
    :poster,
    :score,
    :genres,
    presence: true

  validates :title, :poster, uniqueness: { case_sensitive: false }
end
