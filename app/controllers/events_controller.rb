class EventsController < ApplicationController
	def index
            if !user_signed_in?
                redirect_to new_user_session_path
            else
		#@user = current_user
		@events = current_user.events.find(:all, :order => "start_at")
	    end
	end
	
	def new
            if !user_signed_in?
                redirect_to new_user_session_path
            else
		@event = Event.new
	    end
	end

	def show
            if !user_signed_in?
                redirect_to new_user_session_path
            else
		@event = Event.find(params[:id])
		@events = Event.find(:all, :order => "start_at DESC")
	    end
	end

	def create
		@event = current_user.events.new(params[:event].permit(:name, :start_at, :end_at, :body))
		if @event.save
			redirect_to calendar_path
		else
			render 'new'
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_path
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		@event = Event.find(params[:id])
		@user.update(user_params)	
		redirect_to calendar_path
	end
		
end
