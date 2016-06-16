class Jury
  attr_accessor :members

  def initialize
    @members = []
    @finalists = []
    @votes_hash = {}
  end

  def add_member(member)
    @members << member
  end



  def cast_votes(finalists) #finalists = array of 2 members set in survivr.rb
    @votes_hash = {}
    finalists.each { |finalist| @votes_hash[finalist] = 0 }
    @members.each do |juror|
      vote = finalists.sample
      @votes_hash[vote] += 1
      puts "#{juror} voted for #{vote}"
    end
    return @votes_hash
  end

  def report_votes(final_votes)
    @votes_hash.each { |finalist, votes| puts "#{finalist} with #{votes} votes"}
  end

  def announce_winner(final_votes)
    winner = final_votes.max_by { |finalist, votes| votes }[0]
    puts "WINNER: #{winner}".upcase.green
    return winner
  end
end
