class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if the user exists AND the password entered in correct.
    # if user && user.authenticate(params[:password])
    if user == User.authenticate_with_credentials(params[:email], params[:password])
      # save the user id inside the browser cookie.
      session[:user_id] = user.id
      redirect_to '/'
    else
      # if user login doesn't work, send them back to login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
