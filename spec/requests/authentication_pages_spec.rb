require 'spec_helper'

describe "Authentication" do
	
	subject { page }
	
	describe "signin page" do
		before { visit signin_path }
		
		it { should have_content('Sign in') }
		it { should have_title('Sign in') }
	end

	describe "signin" do
		before { visit signin_path }
		
		describe	"with invalid information"	do
			before { click_button "Sign in" }
			
			it { should have_title('Sign in') }
			it { should have_selector('div.alert.alert-error') }
		
		
			describe "after visiting another page" do
				before { first(:link, "Home").click }
				it { should_not have_selector('div.alert.alert-error') }
			end
		 end
		
		
		#Factory Girl gives us a Testing user/data base with work with
		#so we are telling it to fill in the sign_in fields with info
		#provided on the Factories.rb file in the spec folder
		
		 describe " with valid information " do
			 #this makes a testing variable in which user is the creation of a 
			 #test model using FactoryGirl
			 let(:user)  { FactoryGirl.create(:user) }
			 before do
				 fill_in "Dealer Name", with: user.name.upcase#upcase the test here to make sure that our ability to find the user in the data base is case-insensitive
				 fill_in "Password", 	 with: user.password
				 click_button "Sign in"
				 
			end
			
			#these two below show that the signin with testing factory girl data base
			#is not working
			#it { should have_title("Sign in") }
			#it { should have_selector('div.alert.alert-error') }
			it { should have_title(user.dealer) }
			it { should have_link('Profile',     href: user_path(user))  }
			it { should have_link('Sign out',    href: signout_path) }
			it { should_not have_link('Sign in', href: signin_path) }
			it { should have_content("Cocaine")}
			
			describe "followed by signout" do
				before { click_link 'Sign out' }
					it { should have_link('Sign in')}
			end
		
		end
	end
end
    
  

