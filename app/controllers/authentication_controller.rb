class AuthenticationController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Thank you for logging in!"
      redirect_to root_path
    else
      flash[:notice] = "something went horribly wrong!"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end
end
