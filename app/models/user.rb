class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :tweets, dependent: :destroy

  has_many :followings, foreign_key: :follower_id, dependent: :destroy
  has_many :followed_users, through: :followings, source: :followed_user

  has_many :inverse_followings, class_name: "Following", foreign_key: :followed_user_id, dependent: :destroy
  has_many :followers, through: :inverse_followings, source: :follower


  def follow(user)
    followed_users << user unless self == user || following?(user)
  end

  def unfollow(user)
    followed_users.delete(user)
  end

  def following?(user)
    followed_users.exists?(user.id)
  end

end
