class GroupTalkMessage < ActiveRecord::Base
  belongs_to :group_talk
  belongs_to :user
end
