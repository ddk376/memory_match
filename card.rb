class Card
  def self.create_deck(num_of_matches, match_num)
    cards = []
    match_num.times do
      cards += (1..num_of_matches).to_a
    end
    cards.shuffle.map { |value| self.new(value) }
  end

  attr_reader :value
  attr_accessor :revealed

  def initialize(value)
    @value = value
    @revealed = false
  end

  def hide
    self.revealed = false
  end

  def reveal
    self.revealed = true
    self.value
  end

  def revealed?
    self.revealed
  end

  def to_s
    revealed? ? "#{@value}" : "*"
  end

  def ==(card)
    self.value == card.value
  end
end
