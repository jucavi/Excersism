class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    scores.last
  end

  def personal_best
    scores.max
  end

  def personal_top
    scores.max(3)
  end

  def report
    cond = latest == personal_best ? '' : "#{personal_best - latest} short of "
    "Your latest score was #{latest}. That's #{cond}your personal best!"
  end
end
