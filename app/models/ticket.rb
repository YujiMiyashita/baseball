class Ticket < ActiveRecord::Base
  belongs_to :user
  belongs_to :ballpark
  belongs_to :visitor, class_name: 'Team'
  belongs_to :home, class_name: 'Team'
end
