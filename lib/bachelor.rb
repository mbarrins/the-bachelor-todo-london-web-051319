require "pry"
data = JSON.parse(File.read('spec/fixtures/contestants.json'))

def contestant_hash
  data.values.flatten.map{|contestants| [contestants["name"], contestants]}.to_h
end

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant|
    return contestant["name"].split(" ").first.to_s if contestant["status"] == "Winner"
  end
end

puts get_first_name_of_season_winner(data, "season 16")
puts


def get_contestant_name(data, occupation)
  contestant_hash.select{|contestant, details| details["occupation"] = occupation}.keys
end

puts get_contestant_name(data, occupation)
puts

def count_contestants_by_hometown(data, hometown)
  # code here
end

def get_occupation(data, hometown)
  # code here
end

def get_average_age_for_season(data, season)
  # code here
end
