class NoticesController < ApplicationController
  def index
    @notices = Notice.all.order(created_at: :desc)
  end

  def show
    @notice = Notice.find(params[:id]).specific
  end
end
