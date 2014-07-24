module StaticPagesHelper

	def alphabet()
		letter= ('a'..'z').to_a.sample.upcase
		
		letter
	end

	def new_letter(start_letter)
	 	letter= alphabet
	 	
	 	while letter == start_letter do
	 		letter= alphabet
	 	end
	 	
	 	return letter
	end
	 	
end
