require 'spec_helper'

describe User do
 
 	before do  
 		@user = User.new(name: "Example User", movie: "Example",
 											password: "foobar", password_confirmation: "foobar") 
  end
  
	subject { @user }
		
		it { should respond_to(:name) }
		it { should respond_to(:movie) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:authenticate) }
    
    it { should be_valid }
  
  describe "when name is not present" do
		before { @user.name = " " }
		it { should_not be_valid }
	end
	

	
	describe "when name is too long" do
		before { @user.name = "a" * 51 } 
		it { should_not be_valid }
  end
	
	describe "when name is too short" do
		before { @user.name = "a" * 2 }
		it { should_not be_valid }
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
