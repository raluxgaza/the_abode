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

class Rent < ActiveRecord::Base
  has_many :rental_property
  has_one :property, :through => :rental_property
end
