class Post < ApplicationRecord

  validates :title, :description, :keyword, presence: true, length: { minimum: 5, maximum: 500}

  has_many_attached :images

  belongs_to :user

  has_many :comments

  has_many :favourites

  before_create :randomize_id
  private
  def randomize_id
      begin
        self.id = SecureRandom.random_number(1_000_000_000)
      end while User.where(id: self.id).exists?
    end
end
