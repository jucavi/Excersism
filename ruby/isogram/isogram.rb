class Isogram
  def self.isogram?(str)
    clr_str = str.downcase.scan(/\w/)
    clr_str.size == clr_str.uniq.size
  end
end
