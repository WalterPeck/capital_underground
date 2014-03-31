class UsersController < ApplicationController
  def new
  	@user = User.new #this defined the @user instance variable so we can
  end								 #Get the signup page validation tests to pass
	
	def show
		@user = User.find(params[:id])
	end
	
	def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Albany New York #{@user.name}"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :movie, :password,
                                   :password_confirmation)
    end
end
