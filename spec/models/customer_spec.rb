# == Schema Information
#
# Table name: customers
#
#  id         :integer(4)      not null, primary key
#  full_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Customer do

  before(:each) do
    @attr = { :full_name => "Test User" }
  end

  it "should create an instance give valid attributes" do
    Customer.create!(@attr)
  end

  describe "relationship" do

    it "should belong to rent" do
      renter = Customer.new(@attr)
      renter.should respond_to(:rent)
    end
  end
end
