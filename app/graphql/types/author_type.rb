class Types::AuthorInputType < GraphQL::Schema::InputObject
  graphql_name "AuthorInputType"
  description "All the attributes for creating an author"

# add id for the ability to update or change the record,
  argument :id, ID, required: false
  argument :first_name, String, required: false #, camelize: false
  argument :last_name, String, required: false
  argument :yob, Int, required: false
  argument :is_alive, Boolean, required: false
end

class Types::AuthorType < Types::BaseObject
  description "An Author"


  # these fields are not root fields because they belong to an author
  field :id, ID, null: false
  field :first_name, String, null: true
  field :last_name, String, null: true
  field :yob, Int, null: false
  field :is_alive, Boolean, null: true
  field :full_name, String, null: true

  # by doing this here, the method becomes the resolver, resolving the field full_name
  # defined above
  def full_name
    # compact will not add space if one of the names is missing.
    # we cant talk about first_name and last_name here because we are not in
    # the context of a model, where self is the actual model
    # the object is the parent of these fields
    # object is pointed at the defined query field "author(id:)" in query_type.rb
    ([object.first_name, object.last_name].compact).join " "
  end


  # no resolve method is required for this because the name of the field matches
  # the method on the model
  field :coordinates, Types::CoordinatesType, null: false

  # define an array of Integers by placing Int in []
  field :publication_years, [Int], null: false



end
