class Person
  def initialize(starting_turn,starting_floor,ending_floor)
    @starting_turn  = starting_turn   || 0
    @starting_floor = starting_floor  || 0
    @ending_floor   = ending_floor    || 0
    @complete       = false
    @elevator       = nil
  end

  def complete?
    return @complete
  end

  def run!(turn,elevator)
    return unless turn >= @starting_turn
    return unless @elevator.nil? || @elevator.eql?(elevator)
    if @elevator.nil?
      get_on?(elevator)
    else
      my_floor?
    end
  end

  def get_on?(elevator)
    @elevator = elevator if @starting_floor == elevator.current_floor && elevator.get_on(self)
    elevator.request_pickup(self) if @elevator.nil?
  end

  def my_floor?
    if @ending_floor == @elevator.current_floor
      @elevator.get_off(self)
      @complete = true
    end
  end

  def elevator
    return @elevator
  end

  def starting_floor?
    return @starting_floor
  end
end