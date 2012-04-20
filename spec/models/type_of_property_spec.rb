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
