class Blog < ActiveRecord::Base
  belongs_to :user

  has_many :reverse_favorites, class_name: 'Favorite', dependent: :destroy
  has_many :favorite_users, through: :reverse_favorites, source: :user

  scope :index_all, -> {
    select(:id, :title, :content, :user_id, :image, :created_at)
    .order(created_at: :desc)
    .includes(:user)
  }

  mount_uploader :image, ImageUploader
end
