class Image < ApplicationRecord
  belongs_to :user
  belongs_to :category

  has_many :comments, dependent: :destroy
  has_many :like_images, dependent: :destroy

  validates :user_id, presence: true
  validates :category_id, presence: true
  validates :image, presence: true
  validates :address, presence: true
  validate  :picture_size

  scope :order_by_created_at, ->{order created_at: :desc}

  mount_uploader :image, ImageUploader

  private
  def picture_size
    if image.size > 5.megabytes
      errors.add :picture, I18n.t("warning-max-size")
    end
  end
end
