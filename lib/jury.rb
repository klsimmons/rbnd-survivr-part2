class Jury
  attr_writer :members

  def initialize
    @jury_members = []
    @finalists = []
    @finalists_hash = {}
  end

  def add_member(member)
    @jury_members << member
  end

  def members
    @jury_members
  end

  def cast_votes(finalists)
    finalists.each { |finalist| @finalists_hash[finalist] = 0 } # fills out hash
    7.times do
      finalists.shuffle!
      @finalists_hash[finalists[0]] += 1
      puts finalists[0]
    end
    return @finalists_hash
  end

  def report_votes(final_votes)
    @finalists_hash.each { |k,v| puts "#{k}: #{v}"}
  end

  def announce_winner(final_votes)
    puts "WINNER: #{final_votes.max_by { |k,v| v }[0]}"
  end
end
