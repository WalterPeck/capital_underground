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
    
      flash[:success] = "Welcome to Albany New York #{@user.dealer}" 
      																					
      redirect_to @user #webpage url the profile page...game page
    else
      render 'new' #this overrides the deafult rendering behavior, which would havebeen to render the create view.
    end
  end

# THIS IS NEWWWWW
 def update 
 	
  if params[:buy]
  	show
  	weed_buy
  	cash_buy
  else
  	show
  	weed_sell
  	cash_sell
  end
 	
 	redirect_to @user
 end
 

 
 private


  
    
    
    def user_params
      
      #THIS IS HOW I GET THE DEALER PARAMETER TO GO THROUGH MOTHA FUCKA
      
     # names = params[:user][:dealer].to_s
      
       name = (params[:user][:dealer]).inspect
       params[:user][:name] = name
       
      
     params.require(:user).permit(:name, :movie, :password,
                                   :password_confirmation, :dealer, :cash, :weed)
    end
		
	#THSI IS NEWWW!!!!
	
   def weed_buy
   	@user.update_attribute(:weed, @user.weed + p_weed)
	 end		
	

		def p_cash
		  weed = (params[:user][:weed]).to_i
			cash = (params[:user][:cash]).to_i
		  if weed == 1
		  	return cash
		  elsif weed == 2
		  	return cash * 2
		  elsif weed == 3
		  	return cash * 2.5
		  else
		   nil
		  end
		  
		
	end

	
	def cash_buy
		@user.update_attribute(:cash,@user.cash - p_cash)
	end
	
	def cash_sell
		@user.update_attribute(:cash,@user.cash + p_cash)
  end
  
  def weed_sell
  	@user.update_attribute(:weed, @user.weed - p_weed)
	end
	
	def p_weed
	 (params[:user][:weed]).to_i
  end

end
