# == Schema Information
#
# Table name: rental_properties
#
#  id          :integer(4)      not null, primary key
#  property_id :integer(4)
#  rent_id     :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

class RentalProperty < ActiveRecord::Base
  belongs_to :rent
  belongs_to :property
end
