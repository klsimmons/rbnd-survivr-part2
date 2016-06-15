class Game
  attr_writer :tribes, :immune
  attr_reader :winning_tribe, :combined_tribe

  def initialize(tribe_one, tribe_two)
    @coyopa = tribe_one
    @hunapu = tribe_two
    @tribes = [tribe_one, tribe_two]

  end

  def tribes
    @tribes
  end

  def add_tribe(tribe)
    @tribes << Tribe.new({name: tribe, members: [] })
  end

  def immunity_challenge
    @winning_tribe = @tribes.sample
    puts "#{@winning_tribe} won the immunity challenge!"
    return @winning_tribe
  end

  def clear_tribes
    @tribes = []
  end

# Returns the array of members for the combined_tribe and individual_immunity_challenge
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
    @immune = combined_members.sample
    puts "#{@immune} won immunity"
    return @immune
  end
end
