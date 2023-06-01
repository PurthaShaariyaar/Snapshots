class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

          followability

          has_many :posts
          has_many :favourites
          has_many :comments
          has_one_attached :avatar

          validates :email, presence: true, uniqueness: true

          before_create :randomize_id

          def unfollow(user)
            followerable_relationships.where(followable_id: user.id).destroy_all
          end

          def self.ransackable_attributes(auth_object = nil)
            ["bio", "created_at", "email", "encrypted_password", "id", "remember_created_at", "reset_password_sent_at", "reset_password_token", "updated_at", "username"]
          end

          private

          def randomize_id
            begin
              self.id = SecureRandom.random_number(1_000_000_000)
            end while User.where(id: self.id).exists?
          end


end
