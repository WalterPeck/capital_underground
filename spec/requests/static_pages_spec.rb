require 'spec_helper'

describe "StaticPages" do
 
  describe "Home page" do
    
    it "should have the content 'Capital Underground'" do
   		visit '/static_pages/home'
   		expect(page).to have_content('Capital Underground')
   	end
  	
  	it "should have the title 'Home'" do
  		visit '/static_pages/home'
  		expect(page).to have_title("Capital Underground | Home")
  	end
  end
	
	describe "Help Page" do
		
		it "should have the content 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_content('Help')
		end
		
		it "should have the title 'Help'" do
			visit '/static_pages/help'
			expect(page).to have_title("Capital Underground | Help")
		end
	end

	describe "Score Page" do
		
		it "should have the content 'Your Score'" do
			visit '/static_pages/score'
			expect(page).to have_content('Your Score')
		end
		
		it "shouls habe the title 'Score'" do
			visit '/static_pages/score'
			expect(page).to have_title('Capital Underground | Score')
	  end
	end
end
