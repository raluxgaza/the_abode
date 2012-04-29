# == Schema Information
#
# Table name: addresses
#
#  id               :integer(4)      not null, primary key
#  line1            :string(255)
#  line2            :string(255)
#  city             :string(255)
#  state            :string(255)
#  addressable_id   :integer(4)
#  addressable_type :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#

class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
end
