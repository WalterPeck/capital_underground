require 'spec_helper'

describe "User pages" do
	
	subject {page}
	
	describe "profile page" do
		let(:user) { FactoryGirl.create(:user) } #this :user if from a spec/factories.rb definition
		before { visit user_path(user) }
		
		it { should have_content(user.name) }
		it { should have_title(user.name) }
	end
	
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
  end
 end
end
