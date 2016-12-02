@team_seeds = []
@message = ""


class Team
  attr_accessor :seed
  attr_accessor :school	

  def initialize(seed, school)
    @seed = seed
    @school = school	 	
  end
end


def display_menu clear_menu
  if clear_menu == "yes"
  	system "clear"
  end

  puts "**********************************************************"
  puts "**********************************************************"
  puts "****Welcome to my tournament generator. Enter a selection:"
  puts "**********************************************************"
  puts "**** 1. Enter teams"
  puts "**** 2. List teams"
  puts "**** 3. List matchups"
  puts "**** 0. Exit program"
 
  status_message(@message)
  @message = ""
  
  option = gets.chomp.to_i

  case option
    when 1 then add_team
    when 2 then list_teams
    when 3 then matchups
    when 0 then exit_application
    else
     @message = "Invalid Selection: please choose from menu"
     display_menu("yes")
  end
end


def status_message message
  puts "**** #{@message}"
end


def ret_menu
  puts "return to menu? (y/n):"
  ret = gets.chomp.downcase
    if ret == "y"
      display_menu("yes")
    elsif ret == "n"
  	  exit_application
    else
      ret_menu
  	end  
end


def add_team
  system "clear"
  puts "Enter school name (eg. UGA):"
  school = gets.chomp
  puts "Enter ranking:"
  seed = gets.chomp
  
  team = Team.new(seed, school)
  @team_seeds.push(team)
  @team_seeds.sort! {|a,b| a.seed <=> b.seed }

  @message = "Team Added"
  
  ret_menu
end


def list_teams
  system "clear"
  puts "The #{@team_seeds.length} teams are seeded as follows:"
  @team_seeds.each do |team|
    puts "#{team.seed}. #{team.school}"
  end
  ret_menu
end


def matchups
  system "clear"
  bottom_seed = @team_seeds.length

  if @team_seeds.length % 2 == 0
    top_seed = 1
    middle = @team_seeds.length/2
    second_tier = middle + 1
  else
    bye = 1
    top_seed = 2
    middle = (@team_seeds.length-1)/2
    second_tier = middle + 1
  end

  puts "Matchups are as follows:"

  while top_seed < second_tier do
    if bye == 1
      puts "(#{bye})#{@team_seeds[bye]} bye week first round"
    end

    puts "(#{top_seed})#{@team_seeds[1]} against (#{bottom_seed})#{@team_seeds[2]}"
    top_seed += 1
    bottom_seed -= 1
  end
  ret_menu
end


def exit_application
	puts"**************************************"
	puts"************ Goodbye *****************"
	puts"**************************************"
end

display_menu("yes")


