# == Schema Information
#
# Table name: rents
#
#  id             :integer(4)      not null, primary key
#  amount         :integer(10)
#  created_at     :datetime
#  updated_at     :datetime
#  name           :string(255)
#  description    :text
#  lease_duration :string(255)
#  property_id    :integer(4)
#

require 'spec_helper'

describe Rent do

  describe "relationships" do

    it "should have a property id" do
      new_rent = Rent.new
      new_rent.should respond_to(:property_id)
    end

    it "should belong to property" do
      new_rent = Rent.new
      new_rent.should respond_to(:property)
    end

    it "should belong to rental_property" do
      new_rent = Rent.new
      new_rent.should respond_to(:rental_property)
    end
  end
end
