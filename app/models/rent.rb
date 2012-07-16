# == Schema Information
#
# Table name: rents
#
#  id             :integer(4)      not null, primary key
#  person_id      :integer(4)
#  property_id    :integer(4)
#  start_date     :date
#  end_date       :date
#  amount         :integer(10)
#  payment_status :integer(4)
#  created_at     :datetime
#  updated_at     :datetime
#  name           :string(255)
#

class Rent < ActiveRecord::Base
  belongs_to :property
end
