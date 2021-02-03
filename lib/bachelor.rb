require 'pry'

require 'json'
file = File.read('./spec/fixtures/contestants.json')
data = JSON.parse(file)

def get_all_contenstants(data)
  data.values.flatten
end

def get_first_name_of_season_winner(data, season)
  winner = data[season].filter do |person|
    person["status"] == "Winner"
  end
  winner[0]["name"].split[0]
end

def get_contestant_name(data, occupation)
  lexicon = get_all_contenstants(data)
  contestant = lexicon.find do |person|
    person["occupation"] == occupation
  end
  contestant["name"]
end

def count_contestants_by_hometown(data, hometown)
  lexicon = get_all_contenstants(data)
  lexicon.filter { |person| person["hometown"] == hometown}.length
end

def get_occupation(data, hometown)
  contestant = get_all_contenstants(data).find do |person|
    person["hometown"] == hometown
  end
  contestant["occupation"]
end

def get_average_age_for_season(data, season)
  (data[season].map { |person| person["age"].to_f}.sum/ data[season].length).round
end
