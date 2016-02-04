class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event

  validates :comment, :user_id, :event_id, :presence => true 
end
