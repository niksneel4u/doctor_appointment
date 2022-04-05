class ApplicationController < ActionController::Base
  before_action :validate_user_patient
  TOKEN = 'test'.freeze # we can use jwt to for batter security


  def validate_user_patient
    return if params[:token] == TOKEN

    render json: {
      status: 'error',
      message: 'unauthorize'
    }
  end
end
