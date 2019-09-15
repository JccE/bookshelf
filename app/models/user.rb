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

class User < ApplicationRecord
  has_many :posts, dependent: :destroy
end
