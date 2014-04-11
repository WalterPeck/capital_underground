FactoryGirl.define do
	factory :user do
		name 		 							"clabvessels"
		movie		 							"Pulp Fiction"
		password 							"foobar"
		password_confirmation "foobar"
		dealer 								"clabvessels"
		cash 	500
		weed	0
	end
end