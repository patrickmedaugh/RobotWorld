# require_relative '../../app/models/robot_world'
require 'sequel'
require 'sqlite3'


environments = ["development", "test"]

environments.each do |env|

  Sequel.sqlite("../robot_world_#{env}.sqlite3").create_table :robots do
    primary_key :id
    String :name
    String :city
    String :state
    String :avatar
    Date   :birthdate
    Date   :date_hired
    String :department
  end
end
