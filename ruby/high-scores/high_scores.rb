class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    @scores.last
  end

  def personal_best
    @scores.max
  end

  def personal_top
    @scores.sort.reverse[0,3]
  end

  def report
    rep = "Your latest score was #{latest}. That's "
    latest == personal_best ? rep += "your personal best!" : rep += "#{personal_best - latest} short of your personal best!"
    rep
  end
end
