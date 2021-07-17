class Tournament
  OPPOSITE_RESULTS = { win: :loss, draw: :draw, loss: :win }.freeze
  PUNTUATION       = { win: 3, draw: 1, loss: 0 }.freeze
  TABLE_FORMAT     = '%-30s | %2s | %2s | %2s | %2s | %2s'.freeze
  TABLE_ORDER      = %i[matches win draw loss points].freeze
  TABLE_HEADER     = %w[Team MP W D L P].freeze

  def self.tally(input)
    Tournament.new.tally(input)
  end

  def tally(input)
    results = Parse.results(input)
    p results
  end

  class Parse
    def self.results(input)
      Parse.new.results(input)
    end

    def results(input)
      outcomes = Hash.new { |hash, name| hash[name] = [] }

      return outcomes if input.chomp.empty?

      input
        .lines
        .map { |line| parse_line(line) }
        .flatten(1)
        .each { |name, result| outcomes[name] << result }
      outcomes
    end

    private

    def parse_line(line)
      *teams, match_result = line.chomp.split(';')
      result = match_result.to_sym

      teams.zip([result, OPPOSITE_RESULTS[result]])
    end
  end

  Score = Struct.new(*TABLE_ORDER) do
    def initialize
      members.each { |member| self[member] = 0 }
    end
  end

  class TeamScores
    def initlialize
      @score = Score.new
    end

    # ruby #count
    def win
      @score.win += 1
    end

    def loss
      @score.loss += 1
    end

    def draw
      @score.draw += 1
    end

    def matches
      @score.sum
    end

    def points
      PUNTUATION.sum { |result, value| @score[result] * value }
    end
  end
end

i1 = <<~INPUT

INPUT

i2 = <<~INPUT
  Allegoric Alaskans;Blithering Badgers;win
  Allegoric Alaskans;Blithering Badgers;loss
  Allegoric Alaskans;Blithering Badgers;win
  Allegoric Alaskans;Blithering Badgers;loss
INPUT

i3 = <<~INPUT
  Allegoric Alaskans;Blithering Badgers;win
INPUT

puts
Tournament.tally(i1)

Tournament.tally(i2)

Tournament.tally(i3)
