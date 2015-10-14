require_relative 'card'
class Board
  attr_reader :size, :match_num

  def initialize(size = 4, match_num = 2)
    size = 99 if size > 99
    @grid = Array.new(size) {Array.new(size)}
    @size = size
    @match_num = match_num
    populate
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate
    num_of_matches = (size ** 2) / match_num
    all_cards = Card.create_deck(num_of_matches, match_num)
    all_cards.length.times do |idx|
      @grid[idx / size][idx % size] = all_cards.pop
    end

    self
  end

  def render
    print "   "
    size.times { |coord| print "%3s" % coord }
    puts
    size.times.each do |i|
      print "%3s" % i.to_s
      size.times.each { |j| print "%3s" % "#{@grid[i][j].to_s}" }
      puts
    end
  end

  def won?
    @grid.flatten.compact.all? { |card| card.revealed? }
  end

  def reveal(guessed_pos)
    @grid[guessed_pos].reveal
  end

  def hide(guessed_pos)
    @grid[guessed_pos].hide
  end
end
