class Building
  attr_reader :units

  def initialize
    @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    total_rent = @units.sum { |unit| unit.monthly_rent }
    (total_rent.to_f / @units.length).round(2)
  end

  def renter_with_highest_rent
    occupied_units = @units.find_all { |unit| !unit.renter.nil?}
    occupied_units.max { |a,b| a.monthly_rent <=> b.monthly_rent }.renter
  end

  def annual_breakdown
    @units.inject({}) do |hash,unit|
      hash[unit.renter.name] = unit.monthly_rent*12 if !unit.renter.nil?
      hash
    end
  end
end
