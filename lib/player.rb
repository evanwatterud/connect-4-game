class Player
  attr_accessor :name, :pieces, :choice

  def initialize(pieces, name = nil)
    @name = name
    @pieces = pieces
    @choice = nil
  end
end
