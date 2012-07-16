# == Schema Information
#
# Table name: rental_properties
#
#  id         :integer(4)      not null, primary key
#  rent_id    :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe RentalProperty do

  it "should respond to rent" do
    rental_prop = RentalProperty.new
    rental_prop.should respond_to(:rent)
  end

  it "should have a rent_id field" do
    rent_prop = RentalProperty.new
    rent_prop.should respond_to(:rent_id)
  end
end
