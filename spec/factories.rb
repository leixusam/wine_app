FactoryGirl.define do
  factory :user do
    sequence(:username)  	{ |n| "person#{n}" }
    sequence(:name)  			{ |n| "Person #{n}" }
    sequence(:email) 			{ |n| "person_#{n}@example.com"}   
    password "foobar"
    password_confirmation "foobar"
  end

  factory :wine do
  	sequence(:winery)			{ |n| "Winery #{n}" }
  	sequence(:varietal)		{ |n| "Varietal #{n}" }
  	sequence(:name)				{ |n| "Name #{n}" }
  	sequence(:vintage)		{ |n| "#{n}" }
  	sequence(:region)			{ |n| "Region #{n}" }
  end
end