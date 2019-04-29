require "pry"

def get_first_name_of_season_winner(data, season)
  # code here
end

def get_contestant_name(data, occupation)
  # code here
end

def count_contestants_by_hometown(data, hometown)
  # code here
end

def get_occupation(data, hometown)
  # code here
end

def get_average_age_for_season(data, season)
  # code here
end

def batchelor_data
	{
	  "season 30": [
	    {
	      "name":      "Beth Smalls",
	      "age":       "26",
	      "hometown":  "Great Falls, Virginia",
	      "occupation":"Nanny/Freelance Journalist",
	      "status":    "Winner"
	    },
	    {
	      "name":       "Becca Tilley",
	      "age":        "27",
	      "hometown":   "Shreveport, Louisiana",
	      "occupation": "Chiropractic Assistant",
	      "status":     "Eliminated Week 8"
	    }
	  ],
	  "season 29": [
	    {
	      "name":      "Ashley Yeats",
	      "age":       "24",
	      "hometown":  "Denver, Colorado",
	      "occupation":"Dental Assitant",
	      "status":    "Winner"
	    },
	    {
	      "name":       "Sam Grover",
	      "age":        "29",
	      "hometown":   "New York, New York",
	      "occupation": "Entertainer",
	      "status":     "Eliminated Week 6"
	    }
	  ]
	}
end

bachelor_data.map do |season, contestants|
  binding.pry
  [season, contestants.each_with_object([]){|arr,contestant| arr << contestant[:name]}]
end
