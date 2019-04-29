# require "pry"
# data = JSON.parse(File.read('spec/fixtures/contestants.json'))

def contestant_hash(data)
  data.values.flatten.map{|contestants| [contestants["name"], contestants]}.to_h
end

def get_first_name_of_season_winner(data, season)
  data[season].each {|contestant| return contestant["name"].split(" ").first if contestant["status"] == "Winner"}
end

def get_contestant_name(data, occupation)
  contestant_hash(data).each {|contestant, details| return contestant if details["occupation"] == occupation}
end

def count_contestants_by_hometown(data, hometown)
  contestant_hash(data).select{|contestant, details| details["hometown"] == hometown}.keys.count
end

def get_occupation(data, hometown)
  contestant_hash(data).each{|contestant, details| return details["occupation"] if details["hometown"] == hometown}
end

def get_average_age_for_season(data, season)
  data[season].reduce(0){|sum, contestant| sum + contestant["age"].to_f / data[season].length}.round
end
