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

class Rent < ActiveRecord::Base
  has_many :rental_property
  belongs_to :property
end
