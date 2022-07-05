class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :replies

  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end
end
