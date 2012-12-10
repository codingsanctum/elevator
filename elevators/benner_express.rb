require File.join(File.dirname(__FILE__), 'elevator')

class BennerExpress < Elevator

  # def move
  #   increment_floor!
  # end

  def name
    return 'Benner Express'
  end
end