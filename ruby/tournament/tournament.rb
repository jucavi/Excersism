class Tournament
  OPPOSITE_RESULTS = { win: :loss, draw: :draw, loss: :win }.freeze
  TOURNAMENT_PUNTUATION = { win: 3, draw: 1, loss: 0 }.freeze
  HEADER = %w[team matches\ played won drawn lost points].freeze

  def initialize
    @teams = []
  end

  def self.tally(input)
    Tournament.new.tally(input)
  end

  def tally(input)
    file = data_collection(input) ? header + table_body_by(:points) : header
    stat_size = row_size(file)

    file.map { |name, stats| print_line(name, stats, 30, stat_size) }
        .join("\n") + "\n"
  end

  private

  # Team class
  class Team
    attr_reader :name, :score
    RESULTS = OPPOSITE_RESULTS.keys.freeze
    Score = Struct.new(:match_played, *RESULTS, :points)

    def initialize(name)
      @name = name
      @score = Score.new(0, 0, 0, 0, 0)
    end

    def add(result)
      raise ArgumentError unless RESULTS.include?(result)

      @score[:match_played] += 1
      @score[result] += 1
      @score[:points] += TOURNAMENT_PUNTUATION[result]
      self
    end
  end

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

    # [[team1, :outcome], [team2, :opposite_outcome]]
    teams.zip([result, OPPOSITE_RESULTS[result]])
  end

  def row_size(file)
    file.map { |_name, score| score.map { |s| s.to_s.length }.max }.max
  end

  def parse_stats(stats, stat_row)
    stats.map { |a| a.to_s.rjust(stat_row) }
  end

  def print_line(name, stats, name_row, stat_row)
    [name.ljust(name_row), *parse_stats(stats, stat_row)].join(' | ')
  end

  def acronym(scores)
    scores.map { |stat| stat.split.map(&:chr).join.upcase }
  end

  def header
    team, *scores = HEADER

    [[team.capitalize, acronym(scores)]]
  end

  def table_body_by(stat = :points)
    sort_by(stat).map { |team| [team.name, team.score.to_a] }
  end

  def sort_by(stat = :points)
    @teams.sort_by { |team| [-team.score[stat], team.name] }
  end
end
