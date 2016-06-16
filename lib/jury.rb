class Jury
  attr_writer :jury_members

  def initialize
    @jury_members = []
    @finalists = []
    @votes_hash = {}
  end

  def add_member(member)
    @jury_members << member
  end

  def members
    @jury_members
  end

  def cast_votes(finalists) #finalists = array of 2 members set in survivr.rb
    @votes_hash = {}
    finalists.each { |finalist| @votes_hash[finalist] = 0 }
    @jury_members.each do |juror|
      vote = finalists.sample
      @votes_hash[vote] += 1
      puts "#{juror} voted for #{vote}"
    end
    return @votes_hash
  end

  def report_votes(final_votes)
    puts "And the final votes are:"
    @votes_hash.each { |finalist, votes| puts "#{finalist} with #{votes} votes"}
  end

  def announce_winner(final_votes)
    puts "WINNER: #{final_votes.max_by { |k,v| v }[0]}"
  end
end
