class Oystercard

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1
  attr_reader :balance
  attr_reader :entry_station
  attr_reader :journey_hash 

  def initialize
    @balance = 0
    @journey_hash = {}
  end

  def top_up(amount)
    fail "Maximum balance #{MAXIMUM_BALANCE} exceeded" if amount + balance > MAXIMUM_BALANCE
    @balance += amount
  end

  def touch_in(station)
    fail "Balance low!" if balance < MINIMUM_BALANCE 
    @entry_station = station
  end

  def touch_out(exit_station)
    journey_hash.store(entry_station, exit_station)
    deduct(MINIMUM_BALANCE)
    @entry_station = nil
  end

  def in_journey?
    !!entry_station
  end
  
  private

  def deduct(amount)
    @balance -= amount
  end

end