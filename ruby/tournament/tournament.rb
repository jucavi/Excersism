class Tournament
  OPPOSITE_RESULTS = { win: :loss, draw: :draw, loss: :win }.freeze
  PUNTUATION       = { win: 3, draw: 1, loss: 0 }.freeze
  TABLE_FORMAT     = '%-30s | %2s | %2s | %2s | %2s | %2s'.freeze
  TABLE_ORDER      = %i[matches win draw loss points].freeze

  def initialize
    @teams = Hash.new { |hash, team| hash[team] = TeamScore.new }
  end

  def self.tally(input)
    Tournament.new.tally(input)
  end

  def tally(input)
    file(input).join("\n") + "\n"
  end

  private

  TeamScore = Struct.new(*TABLE_ORDER) do
    def initialize
      members.each { |member| self[member] = 0 }
    end

    def add_score(result)
      raise ArgumentError unless PUNTUATION.key?(result)

      self[:matches] += 1
      self[:points] += PUNTUATION[result]
      self[result] += 1
    end
  end

  def data_collection(input)
    return nil if input.chomp.empty?

    input.lines do |line|
      parse_line(line).each { |name, result| @teams[name].add_score(result) }
    end
  end

  def parse_line(line)
    *teams, match_result = line.chomp.split(';')
    result = match_result.to_sym

    teams.zip([result, OPPOSITE_RESULTS[result]])
  end

  def file(input)
    data_collection(input) ? [header, table] : [header]
  end

  def header
    format TABLE_FORMAT, 'Team', 'MP', 'W', 'D', 'L', 'P'
  end

  def row(team, score)
    format TABLE_FORMAT, team, *TABLE_ORDER.map { |property| score[property] }
  end

  def table
    teams_sort.map { |team, score| row(team, score) }
  end

  def teams_sort
    @teams.sort_by { |team, score| [-score[:points], team] }
  end
end
