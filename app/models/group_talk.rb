class GroupTalk < ActiveRecord::Base
  has_many :group_talk_members
  has_many :users, through: :group_talk_members
  has_many :group_talk_messages, dependent: :destroy
end
