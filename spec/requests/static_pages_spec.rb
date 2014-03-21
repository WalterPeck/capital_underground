require 'spec_helper'

describe "StaticPages" do
 	
 	#let(:base_title) {"Capital Underground"} <--From the commented out section below
 	
  subject {page}
  
  describe "Home page" do
 		before { visit root_path }   
    it { should have_content('Capital Underground') }
    it { should have_title(full_title('')) }
    it { should_not have_title("| Home") }
 	end  		
  
  describe "Help page" do
  	before { visit help_path }
  	
  	it { should have_content('Help') }
    it { should have_title(full_title('Help')) } 	
  end
  
  describe "Score page" do
  	before {visit score_path }
  	
  	it { should have_content('Your Score') }
  	it { should have_title(full_title('Score')) }
  end	
end
#THESE ARE ALL OF THE ORIGINAL TESTS IN THEIR MOST BASIC FORMS
#IT MAKES IT EASIER TO SEE WHAT IS GOING ON COMPARED TO THE ONES
#ABOVE

#describe "Help Page" do
		
	#	it "should have the content 'Help'" do
#			visit '/help'
#			expect(page).to have_content('Help')
#		end
		
#		it "should have the title 'Help'" do
#			visit '/help'
#			expect(page).to have_title("#{base_title} | Help")
#		end
#	end

	#describe "Score Page" do
		
	#	it "should have the content 'Your Score'" do
#			visit '/score'
#			expect(page).to have_content('Your Score')
#		end
		
	#	it "should have the title 'Score'" do
	#		visit '/score'
#			expect(page).to have_title("#{base_title} | Score")
#	  end
#	end
	
#	describe "Sign in Page " do
	#	it "should have the content 'Sign In'" do
#			visit 'static_pages/signin'
#			expect(page).to have_content('Sign in')
#    end
 	
# 	it "should have the title 'Sign In'" do
#		visit '/static_pages/contact'
#		expect(page).to have_title("Capital Underground | Sign In")
#	end
# end

