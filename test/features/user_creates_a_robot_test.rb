require_relative '../test_helper'

class UserCreatesARobotTest < FeatureTest
  def test_user_can_create_a_robot
    visit '/'
    click_link_or_button('Robo-Creation')
    fill_in('robot[name]', with: 'George')
    fill_in('robot[city]', with: 'LA')
    fill_in('robot[state]', with: 'CA')
    fill_in('robot[birthdate]', with: '1/1/1')
    fill_in('robot[date_hired]', with: '1/1/1')
    fill_in('robot[department]', with: 'Janitor')
    click_link_or_button("submit")
    robot = RobotWorld.all.last
    assert_equal "George", robot.name
    assert_equal "Janitor", robot.department
  end

end
