class SessionsController < ApplicationController
	
	def new
	end
	
	def create
		# i added an inspect on the end because i think that will quote the string
		#when it is looking through the name index.  There fore allowing it to match
		user = User.find_by(name: params[:session][:dealer ].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to user
		else
			flash.now[:error] = 'Invalid email/password combination'
		  render 'new'
		end
	end
	
	def destroy
	end
	

end
