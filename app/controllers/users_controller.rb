	class UsersController < ApplicationController
  def new
  	  #This is the variable im trying to use to get the prices to stay the same after you buy
  	@user = User.new #this defined the @user instance variable so we can
  end								 #Get the signup page validation tests to pass
	
	
	
	
	def troy
		 current_user #this is from the sessions helper, take a look
   
     
    if @user.switch == nil  ##
    	@view_variable = '@@switch is nil'
    elsif @user.switch == false
    	@view_variable = '@@switch is NOT nil..it switched..false'
    elsif @user.switch == 'albany'
    	@view_variable = '@@switch is NOT NIL...it is ---- albany'
    elsif @user.switch == 'troy'
    	@view_variable = '@@switch is NOT NIL...it is -----troy'
    else
    	nil
    end
		
		if @user.switch != 'troy'
			@user.troy
		else
			nil
		end	
		
		@first_time =  @user.switch
		@user.switchen('troy') 			#THIS MEANS THAT I CAN CAUSE A VARIABLE CHANGE IN THE CLASS...
    @second_time = @user.switch
		
	end
	
	def albany
		current_user
    
    if @user.switch == nil  ##
    	@view_variable = '@@switch is nil'
    elsif @user.switch == false
    	@view_variable = '@@switch is NOT nil..it switched..false'
    elsif @user.switch == 'albany'
    	@view_variable = '@@switch is NOT NIL...it is ---- albany'
    elsif @user.switch == 'troy'
    	@view_variable = '@@switch is NOT NIL...it is -----troy'
    else
    	nil
    end
		
		if @user.switch != 'albany'
			@user.albz
		else
			nil
		end	
		
		@first_time =  @user.switch
		@user.switchen('albany') #THIS MEANS THAT I CAN CAUSE A VARIABLE CHANGE IN THE CLASS...HOPEFULLY AND REMAINS CONSTANT 
    @second_time = @user.switch
	
	end
	

			
	def show
	
		#The @@switches get reset everytime you add new script to these pages
		#and save because rails does something in order to refresh server for
		#you.  So it is not a switch problem it is just the application reseting
		#itself which means reseting the objects/users attributes like @@switch 
	
		
		
	#	if @first_time == nil #this is always nil for now because everytime the page renderes is refreshed all of the instance variables in this controller which makes sense.  This is the controller for the page.  					
	#	set_prices
	#	else
	#	nil
	 # end
		
		current_user
    
  
		

			
		
		
		@first_time =  @user.switch
		@user.switchen('profile') #THIS MEANS THAT I CAN CAUSE A VARIABLE CHANGE IN THE CLASS...HOPEFULLY AND REMAINS CONSTANT 
    @second_time = @user.switch
		

	end
	
#####################################################################	

	def current_user
		@user = User.find(params[:id])
	end
	
#########################################

	def dealer
    	params[:user][:dealer]
  end
	
###########################################

	def create
  	@user = User.new(user_params)
		
   if @user.save
    	sign_in @user
      flash[:success] = "Welcome to Albany New York #{@user.dealer}" 
      redirect_to @user #webpage url the profile page...game page
    else	
      render 'new' #this overrides the deafult rendering behavior, which would havebeen to render the create view.
    end
  	
  	@user.switchen(false)
  end

########################################################
#this is what CONTROLLS THE DRUGS/CASH IN THE DATA BASE AFTER A FORM IS 
#SUBMITTED
 
 def update 
 	@error = false
 	current_user
  if params[:buy_weed] && @user.cash >=  (p_cash('weed')) 
  	weed_buy
  	cash_buy('weed')
  elsif params[:sell_weed] && @user.weed >= weed_amount
  	weed_sell
  	cash_sell('weed')
  elsif params[:buy_shrooms] && @user.cash >=  (p_cash('shrooms'))
		shrooms_buy
  	cash_buy('shrooms')
  elsif params[:sell_shrooms] && @user.shrooms >= shroom_amount
		shrooms_sell
		cash_sell('shrooms')
  elsif params[:buy_molly] && @user.cash >=  (p_cash('molly'))
 		molly_buy
  	cash_buy('molly')
  elsif params[:sell_molly] && @user.molly >= molly_amount
		molly_sell
  	cash_sell('molly')
  elsif params[:buy_cocaine] && @user.cash >=  (p_cash('cocaine'))
  	cocaine_buy
  	cash_buy('cocaine')
  elsif params[:sell_cocaine] && @user.cocaine >= cocaine_amount
  	cocaine_sell
  	cash_sell('cocaine')
  elsif params[:buy_meth] && @user.cash >=  (p_cash('meth'))
  	meth_buy
  	cash_buy('meth')
  elsif params[:sell_meth] && @user.meth >= meth_amount
		meth_sell
		cash_sell('meth')
  elsif params['buy_oxy'] && @user.cash >=  (@user.oxy_price * oxy_amount)
  	oxy_buy
  	cash_buy('oxy')
  elsif params['sell_oxy']  && @user.oxy >= oxy_amount
  	oxy_sell
  	cash_sell('oxy')
  else	
  @error= true #	flash.now[:error] = 'You do not have enough Cash or Drugs to make that transaction.'
  end
 
 
 

	







 if @user.switch == 'albany'
 	    flashin
		 	redirect_to :back
 
  	elsif @user.switch == 'troy'
  	  flashin
  		redirect_to :back #this redirects the page back to troy once a drug has been purchased
		else
		 
		 redirect_to @user
		 
  	end
 end
#################################################################### 

def flashin
 if @error == true
 	flash[:error] = 'You do not have enough Cash/Drugs to complete that transaction.'
 	else
 	nil
 	end
end


 
 private


  
######################################################################    
    
    def user_params
      
      #THIS IS HOW I GET THE DEALER PARAMETER TO GO THROUGH MOTHA FUCKA
      
     # names = params[:user][:dealer].to_s
      
       name = (params[:user][:dealer]).downcase
       params[:user][:name] = name
       
      
     params.require(:user).permit(:name, :movie, :password,
                                   :password_confirmation, :dealer, :cash, :weed, 
                                   :molly, :shrooms, :cocaine, :meth, :oxy)
    end
		
######################################################################	

	
#I need to make everything below into one algarithm so i can use it in 
#for every drug.
######################################################################  
  

	
	def weed_amount
	 (params[:user][:weed]).to_i
  end
  
  def shroom_amount
  	(params[:user][:shrooms]).to_i
  end

	def molly_amount
		(params[:user][:molly]).to_i
	end
	
	def cocaine_amount
		(params[:user][:cocaine]).to_i
	end
	
	def meth_amount
		(params[:user][:meth]).to_i
	end
	
	def oxy_amount
		(params[:user][:oxy]).to_i
	end
		
		
		
		
		def p_cash(drug)
	    
	    if 		drug == 'weed'
		  			
		  			#this variable is for the end of this method. just check it out
		  			drug = weed_amount
						cash = @user.weed_price
	    
	    elsif drug == 'shrooms'
	    			
	    		  drug = shroom_amount
	    			cash = @user.shroom_price
	    
	    elsif drug == 'molly'
	    			
	    			drug = molly_amount
	    			cash = @user.molly_price
	    
	    elsif drug == 'cocaine'
	    	
	    		  drug = cocaine_amount
	    			cash = @user.cocaine_price
	    			
	    elsif drug == 'meth'
	    		
	    			drug = meth_amount
	    			cash = @user.meth_price
	    		
	    elsif drug == 'oxy'
	    			
	    			drug = oxy_amount
	    			cash = @user.oxy_price
	    else nil
	    end
	    
	   if drug == 1
		  	return cash
		  elsif drug == 2
		  	return cash * 2
		  elsif drug == 3
		  	return cash * 2.5
		  elsif drug == 50
		  	return cash 
		  elsif drug == 100
		  	return cash * 2
		  elsif drug == 200
		  	return cash * 3.3
		  else
		   nil
		  end
		  
		
	end

####################################################################	

####################################################################	
	
	def weed_buy
   	@user.update_attribute(:weed, @user.weed + weed_amount)
	end		
	
	def shrooms_buy
		@user.update_attribute(:shrooms, @user.shrooms + shroom_amount)
	end
  
  def molly_buy
		@user.update_attribute(:molly, @user.molly + molly_amount)
	end 
   
  def cocaine_buy
		@user.update_attribute(:cocaine, @user.cocaine + cocaine_amount)
	end
  
  def meth_buy
  	@user.update_attribute(:meth, @user.meth + meth_amount)
  end
  
  def oxy_buy
  	@user.update_attribute(:oxy, @user.oxy + oxy_amount)
  end
  
  def weed_sell
  	@user.update_attribute(:weed, @user.weed - weed_amount)
	end
	
	def shrooms_sell
		@user.update_attribute(:shrooms, @user.shrooms - shroom_amount)
	end
	
	def molly_sell
		@user.update_attribute(:molly, @user.molly - molly_amount)
	end
	
	def cocaine_sell
		@user.update_attribute(:cocaine, @user.cocaine - cocaine_amount)
  end
  
  def meth_sell
  	@user.update_attribute(:meth, @user.meth - meth_amount)
  end
	
	def oxy_sell
		@user.update_attribute(:oxy, @user.oxy - oxy_amount)
	end
####################################################################
	
	def cash_buy(drug_string)
		@user.update_attribute(:cash,@user.cash - p_cash(drug_string))
	end
	

	
	def cash_sell(drug_string)
		@user.update_attribute(:cash,@user.cash + p_cash(drug_string))
  end
  
  
  
 
	
######################################################################	

end
