require 'spec_helper'

describe "Static Pages" do
 	
 	#let(:base_title) {"Capital Underground"} <--From the commented out section below
 	
  subject {page}
  
  	
  
  shared_examples_for "all static pages" do
  	it { should have_selector( 'h1', text: heading) }
    it { should have_title(full_title(page_title))  } 
  end

	describe "Home page" do
		before { visit root_path } 
		let(:heading)    { 'Capital Underground' }
	  let(:page_title) { '' }
	  
	  it_should_behave_like "all static pages"
	  it { should_not have_title('| Home') }
	end
	
	describe "Help page" do
	
		before { visit help_path }
		
		let(:heading)    { 'Help' }
		let(:page_title) { 'Help' }
		
		it_should_behave_like "all static pages"
	end
	
	describe "Schenectady page" do
		before { visit schen_path }
		
		let(:heading)    { 'Schenectady' }
		let(:page_title) { 'Schenectady' }
		
		it_should_behave_like "all static pages"
	end
	
	describe "Score page" do
		before { visit score_path }
		 
		let(:heading)    { 'Your Score' }
	  let(:page_title) { 'Score' }
		
		it_should_behave_like "all static pages"
	end
	
	it "should have the right links on the layout" do
		visit root_path
		first(:link, 'Help').click
		expect(page).to have_title(full_title('Help'))
	  first(:link, 'Home').click
	  expect(page).to have_title(full_title(''))
	  click_link "Start Playing!"
	  expect(page).to have_title(full_title('Sign Up'))
	  click_link "Capital Underground"
	  expect(page).to have_title(full_title(''))
	end
end
 #  describe "Home page" do
 #		before { visit root_path }   
 #   it { should have_content('Capital Underground') }
 #   it { should have_title(full_title('')) }
 #   it { should_not have_title("| Home") }
 #	end  		
 # 
 # describe "Help page" do
 # 	before { visit help_path }
  	
#  	it { should have_selector('h1', text: 'Help') } #this is more specific than content. IMPORTANT
#    it { should have_title(full_title('Help')) } 	
#  end
  
#  describe "Score page" do
#  	before {visit score_path }
  	
#  	it { should have_content('Your Score') }
#  	it { should have_title(full_title('Score')) }
#  end	
#end
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

