class Event < ActiveRecord::Base
  belongs_to :user 

  has_many :attends, dependent: :destroy 
  has_many :comments, dependent: :destroy
  has_many :users, through: :attends

  validates :name, :city, :state, :presence => true 
  validates_date :date, :on => :create, :on_or_after => :today 

  def includes_user(id)
  	self.attends.pluck(:user_id).include?(id)
  end

  def find_attend_id current_user
  	Attend.select(:id).where(user:current_user, event:self).pluck(:id)[0]
  end 
end
