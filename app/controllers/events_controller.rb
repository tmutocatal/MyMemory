class EventsController < ApplicationController
	def index
		@user = current_user
		@events = Event.find(:all, :order => "start_at")
	end
	
	def new
		@event = Event.new
	end

	def show
		@event = Event.find(params[:id])
		@events = Event.find(:all, :order => "start_at DESC")
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
