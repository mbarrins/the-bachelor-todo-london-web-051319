require "pry"
data = JSON.parse(File.read('spec/fixtures/contestants.json'))

def contestant_hash(data)
  data.values.flatten.map{|contestants| [contestants["name"], contestants]}.to_h
end

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant|
    return contestant["name"].split(" ").first.to_s if contestant["status"] == "Winner"
  end
end

puts
puts get_first_name_of_season_winner(data, "season 16")
puts "Should be Courtney"
puts get_first_name_of_season_winner(data, "season 10")
puts "Should be Tessa"
puts get_first_name_of_season_winner(data, "season 15")
puts "Should be Emily"


def get_contestant_name(data, occupation)
  # binding.pry
  contestant_hash(data).select{|contestant, details| details["occupation"] == occupation}.keys
end

puts
puts get_contestant_name(data, "Cruise Ship Singer")
puts "Should be Carly Waddell"
puts get_contestant_name(data, "Community Organizer")
puts "Should be Brooke Burchette"
puts get_contestant_name(data, "Nonprofit director")
puts "Should be Dianna Martinez"

def count_contestants_by_hometown(data, hometown)
  contestant_hash(data).select{|contestant, details| details["hometown"] == hometown}.keys.count
end

puts
puts count_contestants_by_hometown(data, "New York, New York")
puts "Should be 4"
puts count_contestants_by_hometown(data, "Chicago, Illinois")
puts "Should be 8"
puts count_contestants_by_hometown(data, "San Diego, California")
puts "Should be 5"

def get_occupation(data, hometown)
  contestant_hash(data).select{|contestant, details| details["hometown"] == hometown}.values.first["occupation"]
end

puts
puts get_occupation(data, "Cranston, Rhode Island")
puts "Should be Journalist"
puts get_occupation(data, "Waverly, Nebraska")
puts "Should be Critical care nurse"
puts get_occupation(data, "Troutdale, Oregon")
puts "Should be Health Club Manager"


# team_player_hash.map do |team, players|
#     [team, players.reduce(0){|sum, (player,details)| sum + details[:points]}]
# end.to_h.max_by{|team, points| points}[0]


def get_average_age_for_season(data, season)
  data.map do |season, contestants|
    [season, contestants.reduce(0){|sum, contestant| sum + contestant["age"]]
  end
end
