module Types  ## could be a module called Types or a class with namespace of Types::QueryType
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator" do
        argument :name, String, required: true
      end

    def test_field(name:)
      Rails.logger.info context[:time]
      "Hello #{name}!"
    end

    # this is the query, it is a root field. the result of querying in graphqi
    # it is resolved by pulling an instance of author from the database by the
    # method author below. the author type is cast on that result
    field :author,
          Types::AuthorType,
          null: true,
          description: "One author" do
      argument :id, ID, required: true
    end

    def author(id:)
      Author.where(id: id).first
    end

    field :authors, [Types::AuthorType], null: false

    def authors
      Author.all
    end


  end
end
