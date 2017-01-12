class Blog < ActiveRecord::Base
  belongs_to :user

  scope :index_all, -> {
    select(:id, :title, :content, :user_id, :image, :created_at)
    .order(created_at: :desc)
    .includes(:user)
  }

  mount_uploader :image, ImageUploader
end
