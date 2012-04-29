# == Schema Information
#
# Table name: type_of_properties
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class TypeOfProperty < ActiveRecord::Base
  belongs_to :property
end
