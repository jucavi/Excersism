class BinarySearch
  attr_reader :list

  def initialize(list)
    raise ArgumentError unless list.sort.eql?(list)
    @list = list
  end

  def search_for(key)
    limit_down = 0
    limit_up = @list.size - 1
    while limit_down <= limit_up
      mid = (limit_up + limit_down) / 2
      if @list[mid] < key
        limit_down = mid + 1
      elsif @list[mid] > key
        limit_up = mid - 1
      elsif @list[mid].eql?(key)
        return mid
      end
    end
    raise RuntimeError
  end

  def middle
    @list.size / 2
  end
end
