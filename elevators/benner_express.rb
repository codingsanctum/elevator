require File.join(File.dirname(__FILE__), 'elevator')

class BennerExpress < Elevator

  def move
    puts floors_waiting
    if @current_direction >= 0
      increment_floor!
    else
      decrement_floor!
    end
  end

  def name
    return 'Benner Express'
  end
end