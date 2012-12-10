class Simulator

  def initialize
    @turn_counter = 0
    @level        = Level.new
    #load elevators
    @elevators = []
    Dir[File.join(File.dirname(__FILE__), 'elevators/*.rb')].each do |f|
      next if File.basename(f) == 'elevator.rb'
      require f.gsub(/.rb$/, '')
      class_name = f.gsub(/\.\/elevators\//,'').gsub(/.rb$/, '').gsub(/^[a-z0-9]|_[a-z0-9]/){ |a| a.upcase }.gsub(/_/,"")
      @elevators << eval("#{class_name}.new(#{@level.top_floor})")
    end
  end

  def run!
    until @level.complete? do
      @elevators.each do |elevator|
        @level.run!(@turn_counter,elevator)
        elevator.run!
      end
      @turn_counter += 1
      current_stats
      break if @turn_counter > 50
    end
  end

  def current_stats
    puts "Turn #{@turn_counter} and #{@level.people_remaining?} people remaining"
  end
end

Dir[File.join(File.dirname(__FILE__), '**/*.rb')].each do |f|
  next if File.basename(f) == 'simulator.rb'
  require f.gsub(/.rb$/, '')
end

Simulator.new.run!