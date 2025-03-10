class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :description, presence: true, length: { minimum: 1, maximum: 500 }
end
