require_relative '../test_helper'

class UserDeletesARobotTest < FeatureTest

  def create_robots(num)
    num.times do |x|
      RobotWorld.create({
                        name: "Bob#{x}",
                        city: "LA#{x}",
                        state: "CA#{x}",
                        birthdate: "1/1/#{x}",
                        date_hired: "0/0/#{x}",
                        department: "#{x}"
                        })
    end
  end

  def test_user_can_delete_a_robot
    visit '/'
    robot = RobotWorld.all.last
    assert_equal "George", robot.name
    assert_equal "Janitor", robot.department
  end

end
