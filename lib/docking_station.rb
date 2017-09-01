require_relative 'bike'

class DockingStation

  DEFAULT_CAPACITY = 20
  attr_reader :capacity

  def initialize (capacity=DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def release_bike
    fail 'No bikes available' if empty?
    fail 'No working bikes' if broken?
    @bikes.reject(&:broken?)
    @bikes.shift
  end

  def dock(bike)
    fail 'Dock full' if full?
    @bikes << bike
  end

  def bike
    @bikes
  end



  private

  def empty?
    @bikes.empty?
  end

  def full?
    @bikes.count >= capacity
  end


  def broken?
    @broken
  end
end
