class TwoBucket
  attr_reader :goal_bucket, :other_bucket, :moves

  def initialize(cap1, cap2, desire, first)
    @buckets = {
      'one' => Bucket.new(cap1),
      'two' => Bucket.new(cap2)
    }
    @desire = desire
    @first = first
    @second = get_other(first)
    @moves = 0
    call_solution
  end

  def add_move
    @moves += 1
  end

  def get_other(bucket_tag)
    bucket_tag.eql?('one') ? 'two' : 'one'
  end

  def solve?
    @buckets.each do |tag, bucket|
      if bucket.got?(@desire)
        @goal_bucket = tag
        @other_bucket = @buckets[get_other(tag)].volume
        return true
      end
    end
    false
  end

  def second_desired?
    if @buckets[@second].capacity.eql?(@desire)
      @buckets[@second].fill
      add_move
    end
  end

  def call_solution
    until solve?
      if @buckets[@first].empty?
        @buckets[@first].fill
      elsif @buckets[@second].full?
        @buckets[@second].empty
      else
        @buckets[@first].pour(@buckets[@second])
      end
      add_move
      second_desired?
    end
  end
end

class Bucket
  attr_accessor :volume
  attr_reader :capacity

  def initialize(capacity)
    @capacity = capacity
    @volume = 0
  end

  def full?
    @volume.eql?(@capacity)
  end

  def empty?
    @volume.eql?(0)
  end

  def got?(volume)
    @volume.eql?(volume)
  end

  def fill
    @volume = @capacity
  end

  def empty
    @volume = 0
  end

  def to_fill
    @capacity - @volume
  end

  def pour(other_bucket)
    if other_bucket.to_fill - @volume < 0
      @volume = @volume - other_bucket.to_fill
      other_bucket.fill
    else
      other_bucket.volume = other_bucket.volume + @volume
      self.empty
    end
  end
end


