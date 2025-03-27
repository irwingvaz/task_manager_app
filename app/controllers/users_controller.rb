class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id    # log them in immediately
        redirect_to root_path, notice: "Account created — welcome!"
      else
        render :new
      end
    end
    
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
  end
  