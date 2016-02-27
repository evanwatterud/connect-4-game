class Player
  attr_accessor :name, :pieces, :choice

  def initialize(pieces)
    @name = nil
    @pieces = pieces
    @choice = nil
  end
end
