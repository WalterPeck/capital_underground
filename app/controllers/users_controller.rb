class UsersController < ApplicationController
  def new
  	@user = User.new #this defined the @user instance variable so we can
  end								 #Get the signup page validation tests to pass
	
	def show
		@user = User.find(params[:id])
	end
	
	  def dealer
    	params[:user][:dealer]
    end
	
	def create
   
   
   @user = User.new(user_params)
  
    if @user.save
    
      flash[:success] = "Welcome to Albany New York #{@user.name} 
      																					hey #{dealer}"
      redirect_to @user #webpage url the profile page...game page
    else
      render 'new' #this overrides the deafult rendering behavior, which would havebeen to render the create view.
    end
  end

  def test
  	
      names = params[:user][:dealer].to_s
      
      
  end 
 
 private


  
    
    
    def user_params
      
      #THIS IS HOW I GET THE DEALER PARAMETER TO GO THROUGH MOTHA FUCKA
      
     # names = params[:user][:dealer].to_s
      
      params[:user][:name] = test
      
     
     
     params.require(:user).permit(:name, :movie, :password,
                                   :password_confirmation, :dealer)
    end
end
