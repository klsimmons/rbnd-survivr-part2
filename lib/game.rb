class Game
  attr_writer :tribes, :immune, :member
  attr_reader :combined_tribe, :losing_tribe

  def initialize(tribe_one, tribe_two)
    @coyopa = tribe_one
    @hunapu = tribe_two
    @tribes = [tribe_one, tribe_two]

  end

  def tribes
    @tribes
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    @losing_tribe = @tribes.sample
    puts "#{@losing_tribe}".red + " has lost immunity challenge!"
    return @losing_tribe
  end

  def clear_tribes
    @tribes = []
  end

# Returns the array of members for the combined_tribe
  def combined_members
    _combined_members = []
    @tribes.each do |tribe|
      _combined_members << tribe.members
    end
    _combined_members.flatten!
  end

  def merge(combined_tribe)
    @combined_tribe = Tribe.new(name: combined_tribe, members: combined_members)
  end

  def individual_immunity_challenge
    # Checks if @combined_tribe has been created for cases where the test runs
    # without calling the merge method
    @combined_tribe = merge("merged") if @combined_tribe.nil?
    @immune = @combined_tribe.members.sample
    puts "#{@immune} won immunity"
    return @immune
  end

  # Avoids repetitious code in phases two and three of survivr.rb
  def complete_council_method
    immune = individual_immunity_challenge
    loser = @combined_tribe.tribal_council(immune: immune)
    @combined_tribe.print_loser
    return loser
  end
end
