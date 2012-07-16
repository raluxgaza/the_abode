# == Schema Information
#
# Table name: rents
#
#  id             :integer(4)      not null, primary key
#  customer_id    :integer(4)
#  start_date     :date
#  end_date       :date
#  amount         :integer(10)
#  payment_status :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#  name           :string(255)
#

require 'spec_helper'

describe Rent do

  describe "relationships" do

    it "should have a customer id" do
      new_rent = Rent.new
      new_rent.should respond_to(:customer_id)
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
