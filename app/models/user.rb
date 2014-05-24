class User < ActiveRecord::Base
	# I DONT KNOW IF I REALL HAVE TO USE THIS FOR THE *USER_NAME*
	# IT WAS A LINE OF CODE TO MAKE SURE that THE *EMAIL*(NON-DUPLICATED) ENTERED
	# THE DATABASE AS LOWERCASE 
  
  def instance
  	@grass
  	@check
  end
  
  has_secure_password
	
	before_save  { name.downcase! }
	before_create :create_remember_token
	
	validates :name, presence: true
	validates :movie, presence: true, length: { minimum:3, maximum: 60 } 
	validates :password, length: { minimum: 6 }
  validates :dealer, presence: true, length: { minimum: 3 , maximum: 50 }, uniqueness: {case_sensitive: false}
	validates :cash,    numericality:  	{ only_integer: true }
	validates :weed,    numericality:  	{ only_integer: true }
  validates :molly,   numericality: 	{ only_integer: true }
	validates :shrooms, numericality:   { only_integer: true }
	
 # :dealer => :name.id2name
  
  
  #these are to help create a unique remember token for each user upon creating a 
  #new user.  This is so they do not have to login everytime they visit the
  #website. The ACTUAL CREATE METHOD IS DOWN BELOW IN THE PRIVATE SECTION..	
  
  
 	def User.new_remember_token
  	SecureRandom.urlsafe_base64
  end
  
  def User.hash(token)
  	Digest::SHA1.hexdigest(token.to_s)
  end
  
  
  #this is all a mess down here.  You need to figure out what the fuck you
  #are doing nigga
  def hello	
  	
  	puts("hello") 
 	
 end
  
  def grass
		@weed
	end
	
	def bling
		@cash
	end
	
	def albany(drug)
		if drug == "weed"
			@weed = (230..300).to_a.sample
		  @weed
	  elsif drug == 'molly'
			@molly = (600..800).to_a.sample
			@molly
	  elsif drug == 'shrooms'
			@shrooms = (200..300).to_a.sample
			@shrooms
		else
			nil
		end
	end
	
	def money(drug)
		@cash = drug
	end




#this is to try and check to see if i was already on this page therefore
#it would not make new prices for the weed.  Ya heard.
	def check
		@check
	end
	
	def alb_check
		@check = "albany"
		@check
	end
	
	private
		
		#double indent methods after private so people can clearly see which 
		# ones are private sennnn.
		def create_remember_token
			self.remember_token = User.hash(User.new_remember_token)
		end
		
end
