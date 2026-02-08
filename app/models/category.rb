class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :name, uniqueness: { case_sensitive: false }

  self.per_page = 5
end
