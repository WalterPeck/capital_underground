require 'spec_helper'

describe User do
 
 	before do  
 		@user = User.new(name: "Example User", movie: "Example",
 											password: "foobar", password_confirmation: "foobar", dealer: "example", cash: 500, weed: 0, molly: 0, shrooms: 0) 
  end
  
	subject { @user }
		
		it { should respond_to(:name) }
		it { should respond_to(:movie) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:remember_token) }
    it { should respond_to(:authenticate) }
    it { should respond_to(:dealer) }
    it { should respond_to(:cash) }
    it { should respond_to(:weed) }
    it { should respond_to(:molly) }
    it { should respond_to(:shrooms) }
    
    it { should be_valid }
  
  
  
  #see if you can do this same type of test for the drug attributes. This 
  # is the correct way to check if the attribute is blank on user creation
  describe "remember token" do
  	before { @user.save }
  	its(:remember_token) { should_not be_blank }
  end
  
  describe "when cash is not present" do
  	before { @user.cash = nil }
  	it { should_not be_valid }
  end  	
  
  describe "when mushrooms are not present" do
  	before { @user.shrooms = nil }
  	it { should_not be_valid }
  end
  
  describe "when molly is not present" do
  	before { @user.molly = nil }
  	it { should_not be_valid }
  end 
   
  describe "when weed is not present" do
  	before { @user.weed = nil }
		it { should_not be_valid }  
  end
  
  describe "when name is not present" do
		before { @user.dealer = " " }
		it { should_not be_valid }
	end
	
  
	
	describe "when name is too long" do
		before { @user.dealer = "a" * 51 } 
		it { should_not be_valid }
  end
	
	describe "when name is too short" do
		before { @user.dealer = "a" * 2 }
		it { should_not be_valid }
	end

	describe "when name is mixed case" do
		let(:mixed_case_name) {"ClabVESSEls"}
		
		it "Should be saved as all lower-case" do
			@user.name = mixed_case_name
			@user.save
			expect(@user.reload.name).to eq mixed_case_name.downcase
		end
	end
	
	describe "when movie is not present" do
		before { @user.movie = " " }
		it { should_not be_valid }
	end
	
	describe "when movie is too long" do
		before { @user.movie = 'a' * 61 }
		it { should_not be_valid }
  end	
	
	describe "when movie is too short" do	
		before { @user.movie = 'aa' }
		it { should_not be_valid }
	end
	
	describe "when user_name is already taken" do
		before do
			user_with_same_name = @user.dup
			user_with_same_name.name = @user.name.upcase
			user_with_same_name.save
		end
	
	
		it { should_not be_valid }
	end

	describe "when password is not present" do
	 before do
	 	@user = User.new(name: "Example User", movie: "Example Movie",
	 										password: " ", password_confirmation: " ")
	 end
	 it { should_not be_valid }
	end
	
	describe "when password doesn't match confirmation" do
		before { @user.password_confirmation = "mismatch" }
		it { should_not be_valid }
	end

	describe "with a password that's too short" do
		before { @user.password = @user.password_confirmation = "a" * 5 }
		it { should be_invalid }
	end
	
	#changed something in here
	describe "return value of authenticate method" do
		before { @user.save } #THIS SAVES THE USER TO THE DATA BASE BEFORE TESTING
		let(:found_user) { User.find_by(name: @user.name) }
		
		describe "with valid password" do
			it { should eq found_user.authenticate(@user.password) }
		end
		
		describe "with invalid password" do
			let(:user_for_invalid_password) { found_user.authenticate("invalid") }
			
			it { should_not eq user_for_invalid_password }
			specify { expect(user_for_invalid_password).to be_false }
	  end  
	end 	
end
