class Tribe
  attr_reader :name, :members

  def initialize(options={})
    @name = options[:name]
    @members = options[:members]
    @immune_array = @members
    puts "#{@name}"
  end

  def to_s
    @name
  end

  def tribal_council(immune)
    @immune = immune[:immune]
    @immune_array = [@members, @immune]
    if @immune_array[0].include?(@immune)
      @immune_array[0].pop
    end
  end
end
