class CalendarController < ApplicationController
  
	def index
	    if !user_signed_in?
	        redirect_to new_user_session_path
	    else
		@month = (params[:month] || (Time.zone || Time).now.month).to_i
		@year = (params[:year] || (Time.zone || Time).now.year).to_i

		@shown_month = Date.civil(@year, @month)

		@event_strips = current_user.events.event_strips_for_month(@shown_month)
	    end
	end
end
