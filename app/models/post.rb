class Post < ApplicationRecord
  belongs_to :users

  validates :title, presence: true, length: { maximum: 100 }
  validates :content, presence: true, length: { maximum: 1000 }
end
