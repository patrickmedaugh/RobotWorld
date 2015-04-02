require_relative '../test_helper'

class RobotWorldTest < MiniTest::Test
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

  def test_robot_world_can_create_robot
    create_robots(1)
    robot = RobotWorld.find(1)
    assert_equal 1, robot.id
    assert_equal "Bob0", robot.name
    assert_equal "LA0", robot.city
    assert_equal "CA0", robot.state
    assert_equal "1/1/0", robot.birthdate
    assert_equal "0/0/0", robot.date_hired
    assert_equal "0", robot.department
  end

  def test_robot_world_can_edit_robot
    create_robots(1)
    robot = RobotWorld.find(1)
    assert_equal "Bob0", robot.name
    RobotWorld.update(1, {
                      name: "Bob",
                      city: "LA",
                      state: "CA",
                      birthdate: "1/1/",
                      date_hired: "0/0/",
                      department: ""
                    })
    robot = RobotWorld.find(1)
    assert_equal "Bob", robot.name
  end

  def test_robot_world_can_delete_robot
    create_robots(3)
    assert_equal 3, RobotWorld.all.count
    RobotWorld.destroy(1)
    assert_equal 2, RobotWorld.all.count
  end

end
