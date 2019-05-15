class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    total_rent = @units.inject(0) { |tot,unit| tot + unit.monthly_rent }
    total_rent.to_f / @units.length
  end
end
