class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:name])
      if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_url
      end
    else
      redirect_to login_url, alert: "Wrong name or password"
    end

  def destroy
    session[:user_id] = nil
    redirect_to store_url, notice: "Session has ended"
  end
end
