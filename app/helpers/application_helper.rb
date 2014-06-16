module ApplicationHelper
	#Returns the full title on a per-page basis.
	def full_title(page_title)
		base_title = "Capital Underground"
		if page_title.empty?
			base_title
		else
			"#{base_title} | #{page_title}"
		end
	end


	def travel
		if current_user.switch == 'troy'
			'<li> HEY </li>'
		end
	end
end



      
  
