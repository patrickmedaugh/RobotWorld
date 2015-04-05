require 'sequel'

class RobotWorld
  def self.create(robot)
    data = { name: robot[:name],
             city: robot[:city],
             state: robot[:state],
             avatar: robot[:avatar],
             birthdate: "#{robot[:dobyear]}-#{robot[:dobmonth]}-#{robot[:dobday]}",
             date_hired: robot[:date_hired],
             department: robot[:department] }
    database.from(:robots).insert(data)
  end

  def self.all
    database[:robots].map do |hash|
      Robot.new(hash)
    end
  end

  def self.find(id)
    raw_robot = database[:robots].find(id)
    Robot.new(raw_robot)
  end

  def self.update(id, data)
    database[:robots].where(id: id).update(data)
  end

  def self.destroy(id)
    database[:robots].where(id: id).delete
  end

  def self.database
    if ENV["ROBOT_WORLD_ENV"] == 'test'
      @database ||= Sequel.sqlite("../../db/robot_world_test.sqlite3")
    else
      @database ||= Sequel.sqlite("db/robot_world_development.sqlite3")
    end
  end

  def self.delete_all
    database[:robots].delete
  end

  def self.average_age
    avg = Time.now.year - database[:robots].avg(:birthdate)
    avg.to_i
  end

end
