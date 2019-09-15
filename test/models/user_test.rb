# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  city       :string
#  country    :string
#  first_name :string
#  last_name  :string
#  number     :string
#  postcode   :string
#  street     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
