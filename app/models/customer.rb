# == Schema Information
#
# Table name: customers
#
#  id         :integer(4)      not null, primary key
#  full_name  :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Customer < ActiveRecord::Base
  belongs_to :rent
end
