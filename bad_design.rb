class BadDesign
  attr_reader :data
  def initialize
    @data = [[71, 165], [67, 178], [59, 210], [78, 250]]
  end

  def bmi
    data.map {|height, weight| weight / height.to_f ** 2 * 703 }
  end
end
