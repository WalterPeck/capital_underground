require 'spec_helper'

# have_content = text in the page
# have_title = text in the title of the page
# have_heading = text in the <h1> tags
#  save_and_open_page  this is a way to open the test page





describe "User pages" do
	
	subject {page}
	
		let(:user) { FactoryGirl.create(:user) } #this :user if from a spec/factories.rb definition

		let(:id) {user.id}		
		let(:weed_count)  {user.weed}
	  let(:flash_error) {'You do not have enough Cash/Drugs to complete that transaction.'}
	 
	
	
	
	###################################### SELLING DRUGS ####################################################	
  
  
  	shared_examples_for "selling" do
  	
  	
  ###################################### WEED ####################################################	
  	
  	
     describe "weed and" do  
  	
  	
  		it "SHOULD subtract weed from the user" do
     	
		 
		 		select '1 ounce', from: 'user_weed'	
				
				expect { click_button('sell_weed'); user.reload }.to change(user, :weed).by(-1)
      
     	end
     
     	it "SHOULD change the users cash" do 
     	
		 
		 		select '1 ounce', from: 'user_weed'	
				
				expect { click_button('sell_weed'); user.reload }.to change(user, :cash)
      
    	end
     
     	it "should	NOT change drug price" do
     	
		 
		 		select '1 ounce', from: 'user_weed'	
				
				expect { click_button('sell_weed'); user.reload }.not_to change(user, :weed_price)
			
      
      end
     
      it "should NOT subtract weed from the user and SHOULD show Flash Error" do
    
    		select '3 ounces', from: 'user_weed'
    	
    	
    	  if user.weed   <  3
    			expect { click_button('sell_weed'); user.reload }.not_to change(user, :weed)
      		should have_selector('div.alert.alert-error', text: flash_error)
    		else
    			expect { click_button('sell_weed'); user.reload }.to change(user, :weed)
    		end
   	  end
     end
   
###################################### SHROOMS ####################################################	   	
   	
   	describe "shrooms and" do  
  	
  	
  		it "SHOULD subtract shrooms from the user" do
     	
		 
		 		select '1 ounce', from: 'user_shrooms'	
				
				expect { click_button('sell_shrooms'); user.reload }.to change(user, :shrooms).by(-1)
      
     	end
     
     	it "SHOULD change the users cash" do 
     	
		 
		 		select '1 ounce', from: 'user_shrooms'	
				
				expect { click_button('sell_shrooms'); user.reload }.to change(user, :cash)
      
    	end
     
     	it "should	NOT change drug price" do
     	
		 
		 		select '1 ounce', from: 'user_shrooms'	
				
				expect { click_button('sell_shrooms'); user.reload }.not_to change(user, :shroom_price)
			
      
      end
     
     it "should NOT subtract shrooms from the user and SHOULD show Flash Error" do
    
    		select '3 ounces', from: 'user_shrooms'
    	
    	
    	  if user.shrooms   <  3
    			expect { click_button('sell_shrooms'); user.reload }.not_to change(user, :shrooms)
      		should have_selector('div.alert.alert-error', text: flash_error)
    		else
    			expect { click_button('sell_shrooms'); user.reload }.to change(user, :shrooms)
    		end
   	  end
     end
     
     ###################################### MOLLY ####################################################	   	
   	
   	describe "molly and" do  
  	
  	
  		it "SHOULD subtract molly from the user" do
     	
		 
		 		select '1 ounce', from: 'user_molly'	
				
				expect { click_button('sell_molly'); user.reload }.to change(user, :molly).by(-1)
      
     	end
     
     	it "SHOULD change the users cash" do 
     	
		 
		 		select '1 ounce', from: 'user_molly'	
				
				expect { click_button('sell_molly'); user.reload }.to change(user, :cash)
      
    	end
     
     	it "should	NOT change drug price" do
     	
		 
		 		select '1 ounce', from: 'user_molly'	
				
				expect { click_button('sell_molly'); user.reload }.not_to change(user, :molly_price)
			
      
      end
     
     it "should NOT subtract molly from the user and SHOULD show Flash Error" do
    
    		select '3 ounces', from: 'user_molly'
    	
    	
    	  if user.molly   <  3
    			expect { click_button('sell_molly'); user.reload }.not_to change(user, :molly)
      		should have_selector('div.alert.alert-error', text: flash_error)
    		else
    			expect { click_button('sell_molly'); user.reload }.to change(user, :molly)
    		end
   	  end
     end
   
###################################### Cocaine ####################################################	   	
   	
   	describe "cocaine and" do  
  	
  	
  		it "SHOULD subtract cocaine from the user" do
     	
		 
		 		select '1 ounce', from: 'user_cocaine'	
				
				expect { click_button('sell_cocaine'); user.reload }.to change(user, :cocaine).by(-1)
      
     	end
    	
    	it "SHOULD change the users cash" do 
     	
		 
		 		select '1 ounce', from: 'user_cocaine'	
				
				expect { click_button('sell_cocaine'); user.reload }.to change(user, :cash)
      
    	end
    
    	it "should	NOT change drug price" do
     	
		 
		 	  select '1 ounce', from: 'user_cocaine'	
				
				expect { click_button('sell_cocaine'); user.reload }.not_to change(user, :cocaine_price)
			
      
      end
     
     	it "should NOT subtract cocaine from the user and SHOULD show Flash Error" do
    
    		select '3 ounces', from: 'user_cocaine'
    	
    	
    	  if user.cocaine   <  3
    			expect { click_button('sell_cocaine'); user.reload }.not_to change(user, :cocaine)
      		should have_selector('div.alert.alert-error', text: flash_error)
    		else
    			expect { click_button('sell_cocaine'); user.reload }.to change(user, :cocaine)
    		end
    	end
    end
   
   
###################################### Meth ####################################################	   	
   	
   	describe "meth and" do  
  	
  	
  		it "SHOULD subtract meth from the user" do
     	
		 
		 		select '1 ounce', from: 'user_meth'	
				
				expect { click_button('sell_meth'); user.reload }.to change(user, :meth).by(-1)
      
     	end
   		
   			it "SHOULD change the users cash" do 
     	
		 
		 		select '1 ounce', from: 'user_meth'	
				
				expect { click_button('sell_meth'); user.reload }.to change(user, :cash)
      
    	end
    
    	it "should	NOT change drug price" do
     	
		 
		 	  select '1 ounce', from: 'user_meth'	
				
				expect { click_button('sell_meth'); user.reload }.not_to change(user, :meth_price)
			
      
      end
   		
   		it "should NOT subtract meth from the user and SHOULD show Flash Error" do
    
    		select '3 ounces', from: 'user_meth'
    	
    	
    	  if user.meth   <  3
    			expect { click_button('sell_meth'); user.reload }.not_to change(user, :meth)
      		should have_selector('div.alert.alert-error', text: flash_error)
    		else
    			expect { click_button('sell_meth'); user.reload }.to change(user, :meth)
    		end
    	end
   	
   	end
   	
###################################### OXY ####################################################	   	
   	
   	describe "oxy and" do  
  	
  	
  		it "SHOULD subtract oxy from the user" do
     	
		 
		 		select '50 pills', from: 'user_oxy'	
				

				expect { click_button('sell_oxy'); user.reload }.to change(user, :oxy).by(-1)
 								   
     	end
   		
   		it "SHOULD change the users cash" do 
     	
		 
		 		select '50 pills', from: 'user_oxy'	
				
				expect { click_button('sell_oxy'); user.reload }.to change(user, :cash)
      
    	end
    
    	it "should	NOT change drug price" do
     	
		 
		 	  select '50 pills', from: 'user_oxy'	
				
				expect { click_button('sell_oxy'); user.reload }.not_to change(user, :oxy_price)
			
      
      end
   	
  		it "should NOT subtract oxy from the user and SHOULD show Flash Error" do
    
    		select '200 pills', from: 'user_oxy'
    	
    	
    	  if user.oxy   <  3
    			expect { click_button('sell_oxy'); user.reload }.not_to change(user, :oxy)
      		should have_selector('div.alert.alert-error', text: flash_error)
    		else
    			expect { click_button('sell_oxy'); user.reload }.to change(user, :oxy)
    		end
    	end 	
   	end
   
   end
  	
  
###################################### BUYING DRUGS ####################################################	  
  	
	 shared_examples_for "buying" do
  	
  	
  ###################################### WEED ####################################################	
  	
  	
     describe "weed and" do  #This makes the whole test read more like english when there is an error
  											# and i can select what test to run. 
  	
  	
  		it "SHOULD add ounces to the WEED attribute" do
     	
		 
		 		select '1 ounce', from: 'user_weed'	
				
				expect { click_button('buy_weed'); user.reload }.to change(user, :weed).by(1)
      
     	end
      
    	it "SHOULD change the users cash" do 
     	
		 
		 		select '1 ounce', from: 'user_weed'	
				
				expect { click_button('buy_weed'); user.reload }.to change(user, :cash)
      
    	end
    
    
    	it "should	NOT change drug price" do
     	
		 
		 		select '1 ounce', from: 'user_weed'	
				
				expect { click_button('buy_weed'); user.reload }.not_to change(user, :weed_price)
			
      
      end
    	
    	it "should NOT add ounces to the user and SHOULD show Flash Error" do
    
    		select '3 ounces', from: 'user_weed'
    	
    	
    	  if (user.weed_price * 2.5) > user.cash
    			expect { click_button('buy_weed'); user.reload }.not_to change(user, :weed)
      		should have_selector('div.alert.alert-error', text: flash_error)
    		else
    			expect { click_button('buy_weed'); user.reload }.to change(user, :weed)
    		end
   	  end
    end  
###################################### SHROOMS ####################################################	

    describe "shrooms and"  do
      
      it "SHOULD add ounces to the user" do
     	
		 
		 		select '1 ounce', from: 'user_shrooms'	
				
				expect { click_button('buy_shrooms'); user.reload }.to change(user, :shrooms).by(1)
      
      end
      
  		
  		
  		it "should	NOT change drug price" do
     	
		 
		 		select '1 ounce', from: 'user_shrooms'	
				
				expect { click_button('buy_shrooms'); user.reload }.not_to change(user, :shroom_price)
			
      
      end
  		
  	
  		
  		it "should NOT add ounces to the user and SHOULD show Flash Error" do
        
        
    		select '3 ounces', from: 'user_shrooms'
    	
    		if (user.shroom_price * 2.5) > user.cash
    			expect { click_button('buy_shrooms'); user.reload }.not_to change(user, :shrooms)
      		should have_selector('div.alert.alert-error', text: flash_error)
  			else
					expect { click_button('buy_shrooms'); user.reload }.to change(user, :shrooms)
  			end
  		
  		end
  	end
  
###################################### MOLLY ####################################################	  		
  		
  	describe "molly and" do	
  		
  		it "should add ounces to the MOLLY attribute" do
     		select '1 ounce', from: 'user_molly'	
			if user.molly_price <= user.cash	#the amount of cash you start off with
				expect { click_button('buy_molly'); user.reload }.to change(user, :molly).by(1)
      else
      	expect { click_button('buy_molly'); user.reload }.not_to change(user, :molly)
      end
      end
      
      
      it "should	NOT change drug price" do
     	
		 
		 		select '1 ounce', from: 'user_molly'	
				
				expect { click_button('buy_molly'); user.reload }.not_to change(user, :molly_price)
			
      
      end
      
      
      
      it "should NOT add ounces to the MOLLY attribute and show Flash Error" do
    
    		select '3 ounces', from: 'user_molly'
    	
    		if (user.molly_price * 2.5) > user.cash
    			expect { click_button('buy_molly'); user.reload }.not_to change(user, :molly)
      		should have_selector('div.alert.alert-error', text: flash_error)
  			else
					expect { click_button('buy_molly'); user.reload }.to change(user, :molly)
  			end
  		
  		end
    end 
 ################################################################################################     
#		These have to be Failing Tests.. do not have enough money to purchase these more expensive  					  		 
 ################################################################################################      
      
    describe "cocaine and" do  
      
      it "should not add ounces to the Cocaine attribute and should flash" do
     	
		    
		 		select '1 ounce', from: 'user_cocaine'	
				
				expect { click_button('buy_cocaine'); user.reload }.not_to change(user, :cocaine)
       
        
        should have_selector('div.alert.alert-error', text: flash_error) 
        
      end
    end  
      
      
    describe "meth and" do  
      it "should not add ounces to the METH attribute" do
     	
		 
		 		select '1 ounce', from: 'user_meth'	
				
				expect { click_button('buy_meth'); user.reload }.not_to change(user, :meth)
     	
     		should have_selector('div.alert.alert-error', text: flash_error) 
     		
      end
    end
      
    describe "oxycontin and" do  
      it "should not add ounces to the Oxycontin attribute" do
     	
		 
		 		select '50 pills', from: 'user_oxy'	
				
				expect { click_button('buy_oxy'); user.reload }.not_to change(user, :oxy)
      
      	should have_selector('div.alert.alert-error', text: flash_error) 
      
      end
		end
	end
	
  describe "signin page" do
		before { visit signin_path }
		
		it { should have_content('Sign in') }
		it { should have_title('Sign in') }
	end

###################################### PAGES AND SIGNIN ####################################################
	
	describe "signin" do
		
		before { visit signin_path }
		
		describe " with valid information " do
			 #this makes a testing variable in which user is the creation of a 
			 #test model using FactoryGirl
			
			 before do
				 fill_in "Dealer Name", with: user.name.upcase#upcase the test here to make sure that our ability to find the user in the data base is case-insensitive
				 fill_in "Password", 	 with: user.password
				 click_button "Sign in"
	  	 end
		
	  
			describe "profile page" do
		
				before { visit user_path(user) }
		    	it { should have_content(user.dealer)  }
					it { should have_title(user.dealer) }
 					it { should have_link('Troy')}
 					it { should have_link('Albany')}
		 	end
	
	
			describe "albany page" do
				before { visit albany_users_path(user)}
	  			it { should have_title(user.dealer)   }
	  			it { should have_link('Troy')}
	  			it_should_behave_like "buying"
					it_should_behave_like "selling"
				end
	
	    describe "troy page" do	
		
	  		before { visit troy_users_path(user)} #there is probably a cleaner way of doing this but.. it works
			  	it { should have_content('troy') }
		 	    it { should have_title(user.dealer) }
			  	it { should have_link('Albany')}
			   	it_should_behave_like "buying"
					it_should_behave_like "selling"
	 	  end
		end
	end
		

			
     
##########################################################################################			
	
	  
	
	


	
	describe "sign up page" do #In the book this is "signup page"
		before { visit signup_path }
 		
 		
 		
 		it { should have_content('Create Your Dealer') }
 		it { should have_title(full_title('Sign Up')) }
 		
 		
 end

 describe "signup" do
 	
 	before { visit signup_path }
 	
 	let(:submit) { "Create my Dealer" }
 	
 	describe "with invalid information" do
 		it "should not create a user" do
 			expect { click_button submit }.not_to change(User, :count)
 		end
 	end
 	
 

 
 
 
  describe "with valid information" do
 	 
 	 before do
 	 	fill_in "User/Dealer Name",  			  with: "Example User"
 	 	fill_in "Movie",        with: "Example Movie"
 	 	fill_in "Password",		  with: "foobar"
 	 	fill_in "Confirmation", with: "foobar"
 	 	
 	 end
 	 
 	 
 	 
 	 it "should create a user" do
 	 	expect { click_button submit }.to change(User, :count).by(1)
   end
   
  
   describe "after saving the user" do
   	before { click_button submit }
		let(:user) { User.find_by(name: "example user") }  
    it { should have_link('Sign out') }
    it { should have_link('Troy') }
    it { should have_link('Albany')}
    it { should have_selector('div.alert.alert-success', text: 'Welcome') }
    
    #describe "when buying ounces" do
     #	it "should add ounces to model data base" do
     	
    end
   end
  end
end
