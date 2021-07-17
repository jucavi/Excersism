class Nucleotide
  def initialize(dna)
    @dna = dna.chars
  end

  def self.from_dna(dna)
    raise ArgumentError, 'Unvalid dna' unless valid_dna?(dna)

    new(dna)
  end

  def count(nucleotide)
    @dna.count(nucleotide)
  end

  def histogram
    @dna.each_with_object(init_hash) { |chr, hash| hash[chr] += 1 }
  end

  def self.valid_dna?(dna)
    dna.chars.all? { |chr| NUCLEOTIDES.include?(chr) }
  end

  private

  NUCLEOTIDES = %w[A T C G].freeze

  def init_hash
    # {"A"=>0, "T"=>0, "C"=>0, "G"=>0}
    NUCLEOTIDES.each_with_object({}) { |key, hash| hash[key] = 0 }
  end
end
