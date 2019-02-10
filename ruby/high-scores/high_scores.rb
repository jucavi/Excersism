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
    rep = "Your latest score was #{latest}. That's "
    if latest == personal_best
      rep += "your personal best!"
    else
      rep += "#{personal_best - latest} short of your personal best!"
    end
  end
end
