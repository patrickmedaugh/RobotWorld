require 'date'

class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :avatar,
              :birthdate,
              :date_hired,
              :department


  def initialize(data)
    @id = data[:id]
    @name = data[:name]
    @city = data[:city]
    @state = data[:state]
    @avatar = "http://robohash.org/#{data[:name]}"
    @birthdate = Date.parse(data[:birthdate])
    @date_hired = Date.parse(data[:date_hired])
    @department = data[:department]
  end
end
