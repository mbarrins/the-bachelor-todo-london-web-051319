require "pry"
data = JSON.parse(File.read('spec/fixtures/contestants.json'))

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant|
    puts "#{contestant["name"]} status: #{contestant["status"]}"
    return contestant["name"].split(" ").first.to_s if contestant["status"] == "Winner"
  end
end

puts get_first_name_of_season_winner(data, "season 16")
puts


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



# bachelor_data.map do |season, contestants|
#   binding.pry
#   [season, contestants.each_with_object([]){|contestant, arr| arr << contestant[:name]}]
# end
#
