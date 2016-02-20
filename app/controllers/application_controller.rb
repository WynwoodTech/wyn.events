class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_pagination

  private

  def set_pagination
    @pagination = {}

    page_param = params[:offset] || params[:page]
    @pagination[:page] = page_param ? page_param.to_i : nil
    @pagination[:per_page] = params[:limit].to_i if params[:limit]
  end
end
