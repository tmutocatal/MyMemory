class ImagesController < ApplicationController
        def create
                @event = Event.find(params[:event_id])
		@image = @event.images.create(image_params)
                redirect_to  event_path(@event.id)
        end
        
	def destroy
                @image = Image.find(params[:id])
                @image.destroy
                redirect_to event_path(params[:event_id])
        end

  private
        def image_params
                params[:image].permit(:title, :body)
	end
end
