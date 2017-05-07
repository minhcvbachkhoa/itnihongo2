class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :image

  has_many :like_comment, dependent: :destroy

  validates :user, presence: true
  validates :image, presence: true
  validates :content, presence: true

  scope :order_by_created_at, ->{order created_at: :desc}
  
end
