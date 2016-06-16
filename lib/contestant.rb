require 'colorizr'

class Contestant
  attr_reader :name

  def initialize(name)
    @name = name
    @colored_contestant = to_s.green
  end

  def to_s
    @name
  end
end
