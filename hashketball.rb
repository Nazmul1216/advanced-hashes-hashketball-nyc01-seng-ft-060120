# Write your code below game_hash
require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here
def get_players
  players = game_hash.keys.map do|team|
  game_hash[team][:players]
  end
  players.flatten
end 

def num_points_scored(player_name)
  found_player = get_players.find do |player|
    player[:player_name] == player_name
  end 
  found_player[:points]
end 

def shoe_size(player_name)
  found_player = get_players.find do |player|
    player[:player_name] == player_name
  end 
  found_player[:shoe]
end 
def team_colors(team_name)
  colors =[]
  if game_hash[:away][:team_name]==team_name
    colors=game_hash[:away][:colors]
  else
    colors=game_hash[:home][:colors]
  end 
end 
def team_names
  names=[]
  names.push(game_hash[:home][:team_name])
  names.push(game_hash[:away][:team_name])
end 
def player_numbers(team_name)
  numbers=[]
  if game_hash[:home][:team_name]==team_name
     players=game_hash[:home][:players]
  else 
     players=game_hash[:away][:players]
  end 
  players.each do |player|
    numbers.push(player[:number])
  end 
  numbers
end 
def player_stats(player_name)
  stats={}
  players=game_hash[:home][:players]
   players.each do |player|
    if player[:player_name]==player_name
      stats=player
    end 
  end 
  players=game_hash[:away][:players]
  players.each do |player|
    if player[:player_name]==player_name
      stats=player 
    end
  end 
  stats 
end
def big_shoe_rebounds
  rebounds=0
  max_shoe_size=0
  players=game_hash[:home][:players]
  players.each do |player|
    if player[:shoe]>max_shoe_size
      max_shoe_size=player[:shoe]
    end 
  end
  players=game_hash[:away][:players]
  players.each do |player|
    if player[:shoe]>max_shoe_size
      max_shoe_size=player[:shoe]
    end 
  end 
  players=game_hash[:home][:players]
  players.each do |player|
    if player[:shoe]==max_shoe_size
      rebounds=player[:rebounds]
    end 
  end 
  players=game_hash[:away][:players]
  players.each do |player|
    if player[:shoe]==max_shoe_size
      rebounds=player[:rebounds]
    end 
  end 
  rebounds 
end 

# I followed the code from the youtube video Hashketball 091619 by Evans Wang for this lab.