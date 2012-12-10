class Elevator
  MAX_CAPACITY = 3

  def initialize(top_floor)
    @current_floor          = 0
    @current_riders         = []
    @top_floor              = top_floor
    @current_direction      = 0
    @people_needing_pickup  = []
  end

  def increment_floor!
    return decrement_floor! if @current_floor == @top_floor
    @current_floor += 1
    @current_direction = 1
  end

  def decrement_floor!
    return increment_floor! if @current_floor == 0
    @current_floor -= 1
    @current_direction = -1
  end

  def run!
    move
    puts "#{name} at #{@current_floor} with #{@current_riders.count}"
  end

  def move
    if @current_direction >= 0
      increment_floor!
    else
      decrement_floor!
    end
  end

  def name
    return "Elevator"
  end

  def current_floor
    return @current_floor
  end

  def get_on(person)
    return false if @current_riders.count >= MAX_CAPACITY
    @current_riders << person
    @people_needing_pickup.delete(person)
    return true
  end

  def get_off(person)
    @current_riders.delete(person)
  end

  def request_pickup(person)
    @people_needing_pickup << person
    @people_needing_pickup.uniq!
  end

  def floors_waiting
    floors = []
    @people_needing_pickup.each do |p|
      floors << p.starting_floor
    end
    return floors.uniq
  end
end