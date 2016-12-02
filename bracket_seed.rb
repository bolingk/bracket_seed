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
  	  display_menu("yes")
  	end  
end


def add_team
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
  puts "The #{@team_seeds.length} teams are seeded as follows:"
  @team_seeds.each do |team|
    puts "#{team.seed}. #{team.school}"
  end
  ret_menu
end


def matchups
  if @team_seeds.length % 2 == 0
    puts "Even number of teams"
    # unshift element + pop element
    # somehow access @seed and @school attributes
    # delete those two elements from local array
  else
    puts "Odd number of teams"
    # unshift one seed from array
    # then carry out the if expression on remaining.
    # delete from local array
  end
  ret_menu
end


def exit_application
	puts"**************************************"
	puts"************ Goodbye *****************"
	puts"**************************************"
end

display_menu("yes")


