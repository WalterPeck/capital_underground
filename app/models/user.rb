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
	
	validates :name, presence: true
	validates :movie, presence: true, length: { minimum:3, maximum: 60 } 
	validates :password, length: { minimum: 6 }
  validates :dealer, presence: true, length: { minimum: 3 , maximum: 50 }, uniqueness: {case_sensitive: false}
	validates :cash, numericality: { only_integer: true }
	validates :weed, numericality: { only_integer: true }

	  
 # :dealer => :name.id2name
  
  def hello	
  	
  	puts("hello") 
 	
 end
  
  def grass
		@weed
	end
	
	def bling
		@cash
	end
	
	def albany
		@weed = (230..300).to_a.sample
		@weed
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
	

end
