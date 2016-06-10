class Tribe
  attr_reader :name, :members

  def initialize(name)
    @name = name
    @members = members
    puts "#{@name}"
  end
end
