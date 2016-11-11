class PersonalTalk < ActiveRecord::Base
  has_many :personal_talk_members, dependent: :destroy
  has_many :users, through: :personal_talk_members
  has_many :personal_talk_messages, dependent: :destroy
end
