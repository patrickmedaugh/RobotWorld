require_relative '../test_helper'

class RobotWorldTest < MiniTest::Test
  def create_robots(num)
    num.times do |x|
      RobotWorld.create({
                        name: "Bob#{x}",
                        city: "LA#{x}",
                        state: "CA#{x}",
                        birthdate: Date.new(2000 + x.to_i, 1, 1),
                        date_hired: Date.new(2010 + x.to_i,1,1 ),
                        department: "#{x}"
                      })
    end
  end

  def test_robot_world_can_create_robot
    create_robots(1)
    last = RobotWorld.all.last.id
    robot = RobotWorld.find(last)
    assert_equal last, robot.id
    assert_equal "Bob0", robot.name
    assert_equal "LA0", robot.city
    assert_equal "CA0", robot.state
    assert_equal "2000-01-01", robot.birthdate
    assert_equal "2010-01-01", robot.date_hired
    assert_equal "0", robot.department
  end

  def test_robot_world_can_edit_robot
    create_robots(1)
    last = RobotWorld.all.last.id
    robot = RobotWorld.find(last)
    assert_equal "Bob0", robot.name
    RobotWorld.update(last, {
                      name: "Bob",
                      city: "LA",
                      state: "CA",
                      birthdate: "1/1/",
                      date_hired: "0/0/",
                      department: "N"
                    })
    robot = RobotWorld.find(last)
    assert_equal "Bob", robot.name
    assert_equal "LA", robot.city
    assert_equal "1/1/", robot.birthdate
    assert_equal "0/0/", robot.date_hired
    assert_equal "N", robot.department
  end

  def test_robot_world_can_delete_robot
    create_robots(3)
    robot = RobotWorld.all.last
    assert_equal 3, RobotWorld.all.count
    RobotWorld.destroy(robot.id)
    assert_equal 2, RobotWorld.all.count
  end

  def test_robot_world_can_return_average_age
    create_robots(5)
    assert_equal 3, RobotWorld.average_age
  end

end
