class User < ActiveRecord::Base
	# I DONT KNOW IF I REALL HAVE TO USE THIS FOR THE *USER_NAME*
	# IT WAS A LINE OF CODE TO MAKE SURE that THE *EMAIL*(NON-DUPLICATED) ENTERED
	# THE DATABASE AS LOWERCASE 

	has_secure_password
	before_save { name.downcase! }
	
	validates :name, presence: true, length: { minimum: 3 , maximum: 50 }, uniqueness: {case_sensitive: false}
	validates :movie, presence: true, length: { minimum:3, maximum: 60 } 
	validates :password, length: { minimum: 6 }

end
