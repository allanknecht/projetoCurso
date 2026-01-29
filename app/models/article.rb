class Article < ApplicationRecord
  belongs_to :user
  validates :title, presence: true, length: { minimum: 1, maximum: 100 }
  validates :description, presence: true, length: { minimum: 1, maximum: 500 }

  self.per_page = 5
end
