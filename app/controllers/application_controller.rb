class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from ActiveRecord::RecordNotFound , with: :rescue_record_not_found

  before_filter :set_pagination

  protected

  def rescue_record_not_found(exception)
    render json: { error: { message: exception.message, type: exception.class.name } }, status: :not_found
  end

  private

  def set_pagination
    @pagination = {}

    page_param = params[:offset] || params[:page]
    @pagination[:page] = page_param ? page_param.to_i : nil
    @pagination[:per_page] = params[:limit].to_i if params[:limit]
  end
end
