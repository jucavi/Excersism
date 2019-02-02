class Nucleotide
  def initialize(dna)
    @dna = dna
  end

  def self.from_dna(dna)
    raise ArgumentError unless valid_dna?(dna)
    self.new(dna)
  end

  def count(nucleotide)
    @dna.chars.count(nucleotide)
  end

  def histogram
    @dna.chars.each_with_object(init_hash) { |chr, hash| hash[chr] += 1 }
  end

  private
  NUCLEOTIDES = %w{ A T C G }

  def self.valid_dna?(dna)
    dna.each_char do |chr|
      break false unless NUCLEOTIDES.include?(chr)
    end
  end

  def init_hash
      # {"A"=>0, "T"=>0, "C"=>0, "G"=>0}
      NUCLEOTIDES.each_with_object({}) { |key, hash| hash[key] = 0 }
    end
end

