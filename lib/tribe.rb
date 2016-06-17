require 'colorizr'

class Tribe
  attr_reader :name, :members

  def initialize(options={})
    @name = options[:name]
    @members = options[:members]
    declare_tribe
  end


  def declare_tribe
    puts "Playing for the " + "#{@name}".red + "Tribe are: #{list_members}"
  end

  def list_members
    @members.map { |member| "#{member}" }.join(", ")
  end

  def to_s
    @name
  end

  def tribal_council(options = {})
    # Avoids eliminating immune member
    eliminations = @members.reject { |member| member.eql? options[:immune] }
    @loser = eliminations.sample
    @members.delete(@loser)
    return @loser
  end

  def print_loser
    puts "#{@loser} is voted off. Remaining #{@name.red} Tribe members are:"
    puts "#{list_members}"
  end
end
