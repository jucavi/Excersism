class Tournament
  OUTCOME = {
    win: :loss,
    loss: :win,
    draw: :draw
  }.freeze

  SCORE = {
    win: 3,
    loss: 0,
    draw: 1
  }.freeze

  def initialize
    @teams = Hash.new do |hash, key|
      hash[key] = {
        mp: 0,
        win: 0,
        draw: 0,
        loss: 0,
        p: 0
      }
    end
  end

  def self.tally(input)
    Tournament.new.tally(input)
  end

  def tally(input)
    input.chomp.each_line do |line|
      parse_line(line).each do |team, outcome|
        @teams[team][outcome] += 1
      end unless line.empty?
    end
    mp
    points
    "Team                           | MP |  W |  D |  L |  P\n" << print.join("\n") << "\n"
  end

  def parse_line(line)
    *teams, match_result = line.chomp.split(';')
    teams.zip([match_result.to_sym, OUTCOME[match_result.to_sym]])
  end

  def mp
    @teams.each { |_team, stats| stats[:mp] = stats.values.sum }
  end

  def points
    @teams.each { |_team, stats| stats.each { |stat, value| stats[:p] += value * SCORE[stat] if SCORE.key?(stat) } }
  end

  def write_line(words)
    words.join(' |  ')
  end

  def print
    sorted.map { |team, stats| write_line [team.ljust(30), *stats.values] }
  end

  def sorted
    @teams.sort_by { |team, stats| [-stats[:p], team] }
  end
end
