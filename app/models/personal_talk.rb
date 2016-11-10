class PersonalTalk < ActiveRecord::Base
  has_many :personal_talk_members
  has_many :users, through: :personal_talk_members
end
