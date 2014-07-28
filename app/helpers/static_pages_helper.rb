module StaticPagesHelper

	
	
################################################################	
	
#selects the letter variable to decide which one the kid will be selecting	
	
	def alphabet()
		letter= ('a'..'z').to_a.sample.upcase
		
		letter
	end

#to pick a new letter for the button array, excluding the letter variable
	
	def new_letter(start_letter)
	 	letter= alphabet
	 	
	 	while letter == start_letter do
	 		letter= alphabet
	 	end
	 	
	 	return letter
	end
	 	
################################################################
  #this is to determine id for the star animation
  
  


  def model_id(trigger1,trigger2)
  	if trigger1 == false and letter_trigger2 == false
  		@lt1 = true
  		return "smileModal"
  	elsif letter_trigger1 == true and letter_trigger2 == false
  		@lt2 = true
  		return "smileModal"
		elsif letter_trigger1 == true and letter_trigger2 == true
			return "smileModal"
		end
  end

def level
	
	
	if @level == 1 
		return 'help'
	elsif @level == 2 #this tells me that this is the first button, then sets the variable as such
		return 'about' 	
	else 
		nil
  end


end


def starz

	if @lt1 ==  false
		@lt1 = true
		return '#star1'
	elsif @lt2 == false
		@lt2 = true
		return '#star2'
	elsif @lt1 == true and @lt2 == true
		return '#star3'
	else
		nil
	end
	
end


################################################################

# this is to determine which button gets the modal to pop down

	


	



end
