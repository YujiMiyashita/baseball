class PersonalTalkMessage < ActiveRecord::Base
  belongs_to :user
  belongs_to :personal_talk
end
