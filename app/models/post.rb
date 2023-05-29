class Post < ApplicationRecord

  validates :title, :description, :keyword, presence: true, length: { minimum: 5, maximum: 500}

  has_many_attached :images

  belongs_to :user
end
