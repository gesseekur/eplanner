class AttendsController < ApplicationController
	before_action :require_login
	# before_action :require_correct_user_for_attends, except: [:destroy]
	
	def create  
		attending = Attend.new(attend_params)
		if attending.save
			redirect_to :back
		else 
			flash[:errors]= attending.errors.full_messages 
			redirect_to :back
		end
	end

	def destroy
		a = Attend.find(params[:id])
		if a.destroy
			redirect_to :back
		else 
			flash[:errors] = a.errors.full_messages
			redirect_to :back
		end
	end 

	private
		def attend_params
			params.require(:attend).permit(:user_id, :event_id)
		end
end
