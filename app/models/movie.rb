class Movie < ApplicationRecord
  validates :title,
    :release_date,
    :description,
    :poster,
    :score,
    :genres,
    presence: true

  validates :title, uniqueness: { case_sensitive: false }
end
