class EventsController < ApplicationController
  before_action :require_login
  # before_action :require_correct_user, except: [:index,:show]

  def index
  	user = User.find(session[:user_id])
  	@events_same = Event.all.where(state:user.state)
  	@events_outside = Event.all.where.not(state:user.state)
    @attend = Attend.all
  end

  def create 
  	event = Event.new(event_params)
  	if event.save
  		redirect_to :back
  	else 
  		flash[:errors] = event.errors.full_messages
  		redirect_to :back
  	end 
  end 

  def new 
  end 
  
  def show 
    @event = Event.find(params[:id])
    @comment = @event.comments
    @attends = @event.attends
  end

  def edit
    @event = Event.find(params[:id])
  end 

  def update 
    event = Event.find(params[:id])
    if event.update(event_params)
      redirect_to '/events'
    else 
      event.errors.full_messages
      redirect_to :back
    end 
  end 

  def destroy 
    event = Event.find(params[:id])
    if event.destroy 
      redirect_to :back
    else 
      flash[:error] = "Can't destroy"
      redirect_to :back
    end 
  end

  private 
  	def event_params 
  		params.require(:event).permit(:name, :date, :city, :state, :user_id)
  	end 
end
