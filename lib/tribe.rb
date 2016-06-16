require 'colorizr'

class Tribe
  attr_reader :name, :members
  attr_accessor :immune

  def initialize(options={})
    @name = options[:name]
    @members = options[:members]
    declare_tribe
  end

  def declare_tribe
    puts "Playing for the #{self} Tribe are: #{list_members}"
  end

  def list_members
    @members.map { |member| "#{member}" }.join(", ")
  end

  def to_s
    @name
  end

  def tribal_council(immune)
    @immune = immune
    # Avoids eliminating immune member
    eliminations = @members.reject { |member| member == @immune }
    @loser = eliminations.pop
    @members.delete(@loser)
    return @loser
  end

  def print_loser
    puts "#{@loser} is voted off. Remaining #{self} Tribe members are:"
    puts "#{list_members}"
  end
end
