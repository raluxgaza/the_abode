require 'spec_helper'

describe Property do

  before(:each) do
    @attr = {}
  end

  it "should create an instance given valid attributes" do
    Property.create!(@attr)
  end

  describe "relationship" do

    it "should have one type of property" do
      new_property = Property.new(@attr)
      new_property.should respond_to(:type_of_property)
    end

    it "should have a type_id field" do
      type_id_field = Property.new(@attr)
      type_id_field.should respond_to(:type_id)
    end
  end
end
