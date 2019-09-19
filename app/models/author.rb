# == Schema Information
#
# Table name: authors
#
#  id         :integer          not null, primary key
#  first_name :string
#  is_alive   :boolean
#  last_name  :string
#  yob        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Author < ApplicationRecord

# first way of defining full_name
# second way is in author_type
  # compact will not add space if one of the names is missing
  # def full_name
  #   ([first_name, last_name].compact).join " "
  # end

# return an array of random coordinates for custom field type
  def coordinates
    [rand(90), rand(90)]
  end


  def publication_years
    # slick stuff here
    (1..rand(10)).to_a.map {1900 - rand(100)}
    # gives us, ex: [1880,1821,1873,1879,1883,1823]
  end


# set up validations so we can create error type in graphql
validates :last_name, presence: true

end
