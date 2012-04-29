# == Schema Information
#
# Table name: type_of_properties
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe TypeOfProperty do

  it "should create an instance given valid attributes" do
    TypeOfProperty.create!(:name => "Land")
  end

  describe "relationship" do

    it "should belong to property" do
      land_type = TypeOfProperty.new(:name => "Land")
      land_type.should respond_to(:property)
    end
  end
end
