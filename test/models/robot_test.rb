require_relative '../test_helper'

class RobotTest < MiniTest::Test

  def test_robot_has_correct_attributes
    robot = Robot.new({ "id" => 1,
                        "name" => "Bob",
                        "city" => "LA",
                        "state" => "CA",
                        "birthdate" => "1/1/1",
                        "date_hired" => "0/0/1",
                        "department" => "N"
                        })
    puts RobotWorld.database
    assert_equal 1, robot.id
    assert_equal "Bob", robot.name
    assert_equal "LA", robot.city
    assert_equal "CA", robot.state
    assert_equal "http://robohash.org/Bob", robot.avatar
    assert_equal "1/1/1", robot.birthdate
    assert_equal "0/0/1", robot.date_hired
    assert_equal "N", robot.department
  end
end
