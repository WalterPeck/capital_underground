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
    	sign_in @user
      flash[:success] = "Welcome to Albany New York #{@user.dealer}" 
      redirect_to @user #webpage url the profile page...game page
    else
      render 'new' #this overrides the deafult rendering behavior, which would havebeen to render the create view.
    end
  end

########################################################
#this is what CONTROLLS THE DRUGS/CASH IN THE DATA BASE AFTER A FORM IS 
#SUBMITTED
 
 def update 
 	
  if params[:buy_weed]
  	show
  	weed_buy
  	cash_buy('weed')
  elsif params[:sell_weed]
  	show
  	weed_sell
  	cash_sell('weed')
  elsif params[:buy_shrooms]
  	show
  	shrooms_buy
  	cash_buy('shrooms')
  elsif params[:sell_shrooms]
		show
		shrooms_sell
		cash_sell('shrooms')
  elsif params[:buy_molly]
  	show
  	molly_buy
  	cash_buy('molly')
  elsif params[:sell_molly]
		show
		molly_sell
  	cash_sell('molly')
  elsif params[:buy_cocaine]
  	show
  	cocaine_buy
  	cash_buy('cocaine')
  elsif params[:sell_cocaine]
  	show
  	cocaine_sell
  	cash_sell('cocaine')
  elsif params[:buy_meth]
  	show
  	meth_buy
  	cash_buy('meth')
  elsif params[:sell_meth]
		show
		meth_sell
		cash_sell('meth')
  elsif params['buy_oxy']
  	show
  	oxy_buy
  	cash_buy('oxy')
  elsif params['sell_oxy']
  	show
  	oxy_sell
  	cash_sell('oxy')
  else	
  	nil
  end
 	
 	redirect_to @user
 end
#################################################################### 


 def molly
 	redirect_to @user
 end


 
 private


  
######################################################################    
    
    def user_params
      
      #THIS IS HOW I GET THE DEALER PARAMETER TO GO THROUGH MOTHA FUCKA
      
     # names = params[:user][:dealer].to_s
      
       name = (params[:user][:dealer]).inspect
       params[:user][:name] = name
       
      
     params.require(:user).permit(:name, :movie, :password,
                                   :password_confirmation, :dealer, :cash, :weed, 
                                   :molly, :shrooms, :cocaine, :meth, :oxy)
    end
		
######################################################################	

	
#I need to make everything below into one algarithm so i can use it in 
#for every drug.
######################################################################  
  

	
		
		
		def p_cash(drug)
	    
	    if 		drug == 'weed'
		  			
		  			drug = (params[:user][:weed]).to_i
						cash = (params[:user][:cash]).to_i
	    
	    elsif drug == 'shrooms'
	    			
	    			drug = (params[:user][:shrooms].to_i)
	    			cash = (params[:user][:cash]).to_i
	    
	    elsif drug == 'molly'
	    			
	    			drug = (params[:user][:molly].to_i)
	    			cash = (params[:user][:cash].to_i)
	    
	    elsif drug == 'cocaine'
	    	
	    		  drug = (params[:user][:cocaine].to_i)
	    			cash = (params[:user][:cash].to_i)
	    			
	    elsif drug == 'meth'
	    		
	    			drug = (params[:user][:meth].to_i)
	    			cash = (params[:user][:cash].to_i)
	    		
	    elsif drug == 'oxy'
	    			
	    			drug = (params[:user][:oxy].to_i)
	    			cash = (params[:user][:cash].to_i)
	    else nil
	    end
	    
	   if drug == 1
		  	return cash
		  elsif drug == 2
		  	return cash * 2
		  elsif drug == 3
		  	return cash * 2.5
		  else
		   nil
		  end
		  
		
	end

####################################################################	
	 def p_weed
	 (params[:user][:weed]).to_i
  end
  
  def p_shrooms
  	(params[:user][:shrooms]).to_i
  end

	def p_molly
		(params[:user][:molly]).to_i
	end
	
	def p_cocaine
		(params[:user][:cocaine]).to_i
	end
	
	def p_meth
		(params[:user][:meth]).to_i
	end
	
	def p_oxy 
		(params[:user][:oxy]).to_i
	end
####################################################################	
	
	def weed_buy
   	@user.update_attribute(:weed, @user.weed + p_weed)
	end		
	
	def shrooms_buy
		@user.update_attribute(:shrooms, @user.shrooms + p_shrooms)
	end
  
  def molly_buy
		@user.update_attribute(:molly, @user.molly + p_molly)
	end 
   
  def cocaine_buy
		@user.update_attribute(:cocaine, @user.cocaine + p_cocaine)
	end
  
  def meth_buy
  	@user.update_attribute(:meth, @user.meth + p_meth)
  end
  
  def oxy_buy
  	@user.update_attribute(:oxy, @user.oxy + p_oxy)
  end
  
  def weed_sell
  	@user.update_attribute(:weed, @user.weed - p_weed)
	end
	
	def shrooms_sell
		@user.update_attribute(:shrooms, @user.shrooms - p_shrooms)
	end
	
	def molly_sell
		@user.update_attribute(:molly, @user.molly - p_molly)
	end
	
	def cocaine_sell
		@user.update_attribute(:cocaine, @user.cocaine - p_cocaine)
  end
  
  def meth_sell
  	@user.update_attribute(:meth, @user.meth - p_meth)
  end
	
	def oxy_sell
		@user.update_attribute(:oxy, @user.oxy - p_oxy)
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
