def game_hash
  new_hsh = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        {
        :player_name => "Alan Anderson",
        :number => 0,
        :shoe => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },
        {
        :player_name => "Reggie Evans",
        :number => 30,
        :shoe => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7 
        },
        {
        :player_name => "Brook Lopez",
        :number => 11,
        :shoe => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },
        {
        :player_name => "Mason Plumlee",
        :number => 1,
        :shoe => 19,
        :points => 26,
        :rebounds => 11,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },
        {
        :player_name => "Jason Terry",
        :number => 31,
        :shoe => 15,
        :points => 19,
        :rebounds => 2,
        :assists => 2,
        :steals => 4,
        :blocks => 11,
        :slam_dunks => 1
        }
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        {
        :player_name => "Jeff Adrien",
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      {
        :player_name => "Bismack Biyombo",
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 22,
        :blocks => 15,
        :slam_dunks => 10
      },
      {
        :player_name => "DeSagna Diop",
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      {
        :player_name => "Ben Gordon",
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      {
        :player_name => "Kemba Walker",
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 7,
        :blocks => 5,
        :slam_dunks => 12
      }
      ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.values.each do |team|
    team[:players].each do |name|
      return name[:points] if name.has_value?(player_name)
    end
  end
end

def shoe_size(player_name)
  game_hash.values.each do |team|
    team[:players].each do |name|
      return name[:shoe] if name.has_value?(player_name)
    end
  end
end

def team_colors(team_name)
  game_hash.values.each do |team_stats|
    return team_stats[:colors] if team_stats.has_value?(team_name)
  end
end

def team_names()
  teams = []
  game_hash.values.each do |team_stats|
    teams.push(team_stats[:team_name])
  end  
  return teams
end

def player_numbers(team_name)
  game_hash.values.each do |team_stats|
    if team_stats.has_value?(team_name)
      return team_stats[:players].map {|player| player[:number]}
    end
  end
end

def player_stats(player_name)
  game_hash.values.each do |team_stats|
    team_stats[:players].each do |name|
      if name.has_value?(player_name)
        name.delete(:player_name)
        return name
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe = 0
  player_rebound = 0
  
  game_hash.values.each do |team_stats|
    team_stats[:players].each do |name|
      if name[:shoe] > big_shoe
        big_shoe = name[:shoe]
        player_rebound = name[:rebounds]
      end
    end
  end
  return player_rebound
end

def most_points_scored
  most_points = 0
  points_player = ""
  
  game_hash.values.each do |team_stats|
    team_stats[:players].each do |name|
      if name[:points] > most_points
        most_points = name[:points]
        points_player = name[:player_name]
      end
    end
  end
  return points_player
end

def winning_team
  winner = {}
  game_hash.values.each do |team_stats|
    total_points = 0
    team_stats[:players].each do |name|
      total_points += name[:points]
    end  
      winner[team_stats[:team_name]] = total_points
    end
    winner.key(winner.values.max)
end

def player_with_longest_name
  name_length = 0
  longest_name_player = ""
  
  game_hash.values.each do |team_stats|
    team_stats[:players].each do |name|
      if name[:player_name].length > name_length
        name_length = name[:player_name].length
        longest_name_player = name[:player_name]
      end
    end
  end
  return longest_name_player
end

def long_name_steals_a_ton?
  name_length = 0
  longest_name_player = ""
  most_steals = 0
  stealer = ""
  
  game_hash.values.each do |team_stats|
    team_stats[:players].each do |name|
      if name[:player_name].length > name_length
        name_length = name[:player_name].length
        longest_name_player = name[:player_name]
      end
      if name[:steals] > most_steals
      most_steals = name[:steals]
      stealer = name[:player_name]
      end
    end
  end
  longest_name_player == stealer
end