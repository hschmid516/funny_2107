class OpenMic
  attr_reader :location,
              :date,
              :performers

  def initialize(location: "Switzerland", date: "tomorrow")
    @location   = location
    @date       = date
    @performers = []
  end

  def welcome(user)
    @performers << user
  end

  def repeated_jokes?
    jokes = (@performers.map { |performer| performer.jokes }).flatten
    jokes.uniq.length != jokes.length
  end
end
