class User < ActiveRecord::Base
	# I DONT KNOW IF I REALL HAVE TO USE THIS FOR THE *USER_NAME*
	# IT WAS A LINE OF CODE TO MAKE SURE that THE *EMAIL*(NON-DUPLICATED) ENTERED
	# THE DATABASE AS LOWERCASE 
  
##############################
	@@switch = false
	@@weed = 0
	@@shrooms = 0
	@@molly= 0
	@@cocaine = 0
	@@meth = 0
	@@oxy = 0
	@@police = 0 
############################
  
  has_secure_password
	
	before_save  { self.name.downcase! }
	before_create :create_remember_token
	
	validates :name, presence: true
	validates :movie, presence: true, length: { minimum:3, maximum: 60 } 
	validates :password, length: { minimum: 6 }
  validates :dealer, presence: true, length: { minimum: 3 , maximum: 50 }, uniqueness: {case_sensitive: false}
	validates :cash,    numericality:  	{ only_integer: true }
	validates :weed,    numericality:  	{ only_integer: true }
  validates :molly,   numericality: 	{ only_integer: true }
	validates :shrooms, numericality:   { only_integer: true }
	validates :cocaine, numericality:   { only_integer: true }
  validates :meth,    numericality:   { only_integer: true }
	validates :oxy, 		numericality:  	{ only_integer: true }
 # :dealer => :name.id2name
  
  
  #these are to help create a unique remember token for each user upon creating a 
  #new user.  This is so they do not have to login everytime they visit the
  #website. The ACTUAL CREATE METHOD IS DOWN BELOW IN THE PRIVATE SECTION..	
  
  
 	def User.new_remember_token
  	SecureRandom.urlsafe_base64
  end
  
  def User.digest(token)
  	Digest::SHA1.hexdigest(token.to_s)
  end
  
########################################################################   
########################################################################   
############ POlice METERS AND SUCH ######################  
   
  def police
  	@@police
  end

  


########################################################################   
########################################################################   
  
  def switchen(x) # TEST TO SEE IF THE CONTROLLER CAN CHANGE VARIABLES IN HERE AND THEY REMAIN CONSTANT
  	@@switch = x	
  end
  
  
  
  
  def switch
  	@@switch
  end


########################################################################
###########################||--DRUGS--||##############################
########################################################################

	def weed_price
		@@weed
	end

	def shroom_price
		@@shrooms
	end
	
	def molly_price
		@@molly
	end
	
	def cocaine_price
		@@cocaine
	end
	
	def	meth_price
		@@meth
	end

	def oxy_price
		@@oxy
	end




########################################################################
########################################################################
  def grass
		@weed
	end
	
	def bling
		@cash
	end
	
	def albany(drug)
		if drug == "weed"
			@@weed = (230..300).to_a.sample
		  @@weed
	  elsif drug == 'molly'
			@molly = (600..800).to_a.sample
			@molly
	  elsif drug == 'shrooms'
			@shrooms = (150..300).to_a.sample
			@shrooms
		elsif drug == 'cocaine'
			@cocaine = (1000..1500).to_a.sample
			@cocaine
		elsif drug == 'meth'
			@meth = (550..2000).to_a.sample
		elsif drug == 'oxy'
			@oxy = (1500..3000).to_a.sample
		else
			nil
		end
	end
	
	
	
	
	#this is a more simpilized version of the method above.  This should clean
	#it up alot and make the app faster. As well as preventing drug prices
	#refreshing everytime the user refeshes his page.
	def albz
		@@police = (25..60).to_a.sample 
		@@weed = (230..350).to_a.sample #weed is always a good deal in albany
		@@shrooms = (150..320).to_a.sample
		@@molly = (600..900).to_a.sample
		@@cocaine = (1000..1500).to_a.sample
		@@meth = (550..2000).to_a.sample
		@@oxy = (1000..2000).to_a.sample #cheap oxy because of the hospitals
  
  end
  
  def troy
    @@police = (30..75).to_a.sample 
  	@@weed = (230..380).to_a.sample #raised the high range to 380 because of rpi students
		@@shrooms = (180..370).to_a.sample
		@@molly = (600..850).to_a.sample #lower molly because troy...more scumbags than party students
		@@cocaine = (970..1500).to_a.sample #bigger range on coke
		@@meth = (550..1300).to_a.sample # meth high range is much lower....more meth heads
		@@oxy = (1300..2500).to_a.sample # tweaked the oxy range cuz i dunno  	
  end
	
	def schen
    @@police = (35..80).to_a.sample 
  	@@weed = (200..400).to_a.sample #raised the high range to 380 because of rpi students
		@@shrooms = (200..400).to_a.sample
		@@molly = (400..800).to_a.sample #smaller range for molly
		@@cocaine = (800..1500).to_a.sample #bigger range on coke
		@@meth = (700..1800).to_a.sample # meth high range is much lower....more meth heads
		@@oxy = (1500..2500).to_a.sample # 	
  end
	
	
	def cp
    @@police = (60..95).to_a.sample 
  	@@weed = (280..500).to_a.sample #raised the high range to 380 because of rpi students
		@@shrooms = (240..500).to_a.sample
		@@molly = (700..1000).to_a.sample #smaller range for molly
	  @@cocaine = (1000..1800).to_a.sample #bigger range on coke
		@@meth = (700..1700).to_a.sample # meth high range is much lower....more meth heads
		@@oxy = (1500..3000).to_a.sample # 	
  end
	
	def money(drug)
		@cash = drug
	end
	
	




#this is to try and check to see if i was already on this page therefore
#it would not make new prices for the weed.  Ya heard.
	def check
		@check
	end
	

	
	private
		
		#double indent methods after private so people can clearly see which 
		# ones are private sennnn.
		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)
		end
		
end
