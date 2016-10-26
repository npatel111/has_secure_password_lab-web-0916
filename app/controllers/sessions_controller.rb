class SessionsController < ApplicationController
  def new
  end

  # def create
  #     if user = User.authenticate(params[:email], params[:password])
  #       session[:user_id] = @user.id
  #       flash[:notice] = "Welcome back!"
  #       redirect_to root_path
  #     else
  #       flash.now[:alert] = "Incorrect email/password combination!"
  #       render :new
  #     end
  #   end
  def create
   @user = User.find_by(name: params[:user][:name])
    if @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to controller: 'welcome', action: 'home'
    end
 end

 def destroy
   session.delete :user_id
   redirect_to '/'
 end

end
