class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
  belongs_to :ballpark
  #belongs_to :player
end
