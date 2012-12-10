class Level

  NUM_OF_STARTING_PEOPLE  = 5
  STARTING_TURNS          = [0,0,0,0,0]
  STARTING_LEVELS         = [0,0,0,0,0]
  ENDING_LEVELS           = [2,2,3,5,10]
  TOP_FLOOR               = 12

  def initialize
    @people   = self.generate_people
  end

  def top_floor
    return TOP_FLOOR
  end

  def generate_people
    people = []
    NUM_OF_STARTING_PEOPLE.times do |i|
      people << Person.new(STARTING_TURNS[i],STARTING_LEVELS[i],ENDING_LEVELS[i])
    end
    return people
  end

  def complete?
    return @people.count == 0
  end

  def people_remaining?
    @people.count
  end

  def run!(turn,elevator)
    @people.map{|person| person.run!(turn,elevator) }
    @people.map!{|person| person = person.complete? ? nil : person}.compact!
  end
end