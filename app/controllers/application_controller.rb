class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  skip_before_action :verify_authenticity_token

  helper_method :collection, :resource

  rescue_from ActiveRecord::RecordNotFound do |exception|
    @exception = exception

    render :exception
  end
end
