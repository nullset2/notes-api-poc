class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def welcome 
    render plain: "Note app API --please sign in"
  end
end
