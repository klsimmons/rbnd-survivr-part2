class Game
  attr_writer :tribes

  def initialize(tribe_one, tribe_two)
    @tribe_one = Tribe.new( {name: @tribe_one, members: [] })
    @tribe_two = Tribe.new( {name: @tribe_two, members: [] })
    @tribes = [tribe_one, tribe_two]
  end

  def tribes
    @tribes
  end

  def add_tribe(tribe)
    @tribes << Tribe.new({name: tribe, members: [] })
  end

  def immunity_challenge
    @tribes.sample
  end

  def clear_tribes
    @tribes = []
  end

# Returns the array of members for the combined_tribe and individual_immunity_challenge
  def combined_members
    combined_members = []
    @tribes.each do |tribe|
      combined_members << tribe.members
    end
    combined_members.flatten!
  end

  def merge(combined_tribe)
    @combined_tribe = Tribe.new(name: "New Merged Tribe", members: combined_members)
    end

  def individual_immunity_challenge
    combined_members.sample
  end
end
