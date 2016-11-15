class GroupTalkMember < ActiveRecord::Base
  belongs_to :user
  belongs_to :group_talk
end
