# == Schema Information
#
# Table name: properties
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  address    :text
#  type_id    :integer(4)
#  legal_docs :binary(16777215
#  created_at :datetime
#  updated_at :datetime
#

class Property < ActiveRecord::Base
  has_one :type_of_property

  has_one :address, :as => :addressable
  accepts_nested_attributes_for :address

  has_many :rent, :through => :rental_property
end
