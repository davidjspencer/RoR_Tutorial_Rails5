class UsersController < ApplicationController
  
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  	#debugger ## When visiting page (show) Rails server acts as a console
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to the Sample App"
  		redirect_to @user #Rails automatically infers from redirect_to @user 
  	else				  #that we want to redirect_to user_url(@user)
  		render 'new'
  	end
  end

  private

    def user_params
    	params.require(:user).permit(:name, :email, :password, 
    								:password_confirmation)
    end

end
