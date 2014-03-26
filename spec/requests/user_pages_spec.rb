require 'spec_helper'

describe "User pages" do
	
	subject {page}
	
	describe "create dealer" do
		before { visit signup_path }
 		
 		it { should have_content('Create Your Dealer') }
 		it { should have_title(full_title('Sign Up')) }
 
 end
end
