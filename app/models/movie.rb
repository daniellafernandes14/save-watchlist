class Movie < ApplicationRecord
  has_many :lists
  has_many :bookmarks, dependent: :destroy
end
