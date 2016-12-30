class Profile < ActiveRecord::Base

  mount_uploader :avatar, AvatarUploader

  belongs_to :user
  belongs_to :team
  belongs_to :ballpark
  belongs_to :player
end
