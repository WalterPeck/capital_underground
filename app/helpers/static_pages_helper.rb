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
	 	

  def star_id(letter_trigger1,letter_trigger2)
  	if letter_trigger1 == false and letter_trigger2 == false
  		@lt1 = true
  		return "staranime"
  	elsif letter_trigger1 == true and letter_trigger2 == false
  		@lt2 = true
  		return "staranime2"
		elsif letter_trigger1 == true and letter_trigger2 == true
			return "staranime3"
		end
  end


end
