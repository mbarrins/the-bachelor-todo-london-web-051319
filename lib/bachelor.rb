require "pry"
data = JSON.parse(File.read('spec/fixtures/contestants.json'))

def contestant_hash(data)
  data.values.flatten.map{|contestants| [contestants["name"], contestants]}.to_h
end

def get_first_name_of_season_winner(data, season)
  data[season].each {|contestant| return contestant["name"].split(" ").first if contestant["status"] == "Winner"}
end

puts
puts get_first_name_of_season_winner(data, "season 16")
puts "Should be Courtney"
puts get_first_name_of_season_winner(data, "season 10")
puts "Should be Tessa"
puts get_first_name_of_season_winner(data, "season 15")
puts "Should be Emily"


def get_contestant_name(data, occupation)
  contestant_hash(data).each {|contestant, details| return contestant if details["occupation"] == occupation}
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
  contestant_hash(data).each{|contestant, details| return details["occupation"] if details["hometown"] == hometown}
end

puts
puts get_occupation(data, "Cranston, Rhode Island")
puts "Should be Journalist"
puts get_occupation(data, "Waverly, Nebraska")
puts "Should be Critical care nurse"
puts get_occupation(data, "Troutdale, Oregon")
puts "Should be Health Club Manager"

def get_average_age_for_season(data, season)
  data[season].reduce(0){|sum, contestant| sum + contestant["age"].to_f / data[season].length}.round
end

puts
puts get_average_age_for_season(data, "season 10")
puts "Should be 26"
puts get_average_age_for_season(data, "season 11")
puts "Should be 27 "
puts get_average_age_for_season(data, "season 12")
puts "Should be 26"
