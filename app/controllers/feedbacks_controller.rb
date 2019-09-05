class FeedbacksController < ApplicationController
  def index
    @feedbacks = Feedback.all.order('created_at DESC')

    flash.now[:warning] = 'No feedback found :(' if @feedbacks.empty?
  end
end
