module Api
  class FeedbacksController < ApplicationController
    def create
      @feedback = Feedback.new(params.require(:feedback).permit(:name, :comment))

      flash[:success] = 'Message saved successfully!' if @feedback.save
    end
  end
end
