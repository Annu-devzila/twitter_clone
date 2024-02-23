class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one_attached :video

  validates :title, presence: true
  validates :content, presence: true
  
end
