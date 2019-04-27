class Tournament
  PAIR_RESULTS = { win: :loss, draw: :draw, loss: :win }.freeze
  RESULTS = PAIR_RESULTS.keys.freeze
  TOURNAMENT_POINTS = { win: 3, draw: 1, loss: 0 }.freeze
  Score = Struct.new(:match_played, *RESULTS, :points)

  class Team
    attr_reader :name, :score

    def initialize(name)
      @name = name
      @score = Score.new(0, 0, 0, 0, 0)
    end

    def add(result)
      raise ArgumentError unless RESULTS.include?(result)

      @score[result] += 1
      @score[:match_played] += 1
      @score[:points] += TOURNAMENT_POINTS[result]
      self
    end
  end

  def initialize
    @teams = []
  end

  def self.tally(input)
    Tournament.new.tally(input)
  end

  def tally(input)
    file = data_collection(input) ? header + table_body : header

    file.join("\n") + "\n"
  end

  # def add_team(name)
  #   @teams << Team.new(name)
  # end

  def find_team(name)
    @teams.select { |team| team.name == name }.first
  end

  def data_collection(input)
    return nil if input.chomp.empty?

    input.chomp.each_line do |line|
      parse_line(line).each do |name, result|
        add_team_result(name, result)
      end
    end
  end

  def add_team_result(name, result)
    team = find_team(name)
    team ?  team.add(result) : @teams << Team.new(name).add(result)
  end

  def parse_line(line)
    *teams, match_result = line.chomp.split(';')
    result = match_result.to_sym

    teams.zip([result, PAIR_RESULTS[result]])
  end

  def print_line(name, stats)
    [name.ljust(30), *stats].join(' |  ')
  end

  def header
    ['Team                           | MP |  W |  D |  L |  P']
  end

  def table_body
    sort_by(:points).map { |team| print_line(team.name, team.score) }
  end

  def sort_by(stat)
    @teams.sort_by { |team| [-team.score[stat], team.name] }
  end
end
