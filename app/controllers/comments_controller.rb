class CommentsController < ApplicationController
  before_action :require_login
  # before_action :require_correct_user_id 

  def create
  	comment = Comment.new(comments_params)
  	if comment.save 
  		redirect_to :back 
  	else
  		flash[:errors] = comment.errors.full_messages
  		redirect_to :back
  	end 
  end

  private 
  	def comments_params
  		params.require(:comment).permit(:event_id, :user_id, :comment)
  	end
end
