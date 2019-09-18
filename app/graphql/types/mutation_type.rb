class Types::MutationType < Types::BaseObject


# 1st way of creating a mutation
# CREATE AUTHOR
  field :create_author, AuthorType, null: true, description: "Create an author" do
  # because they are in the AuthorInputType we just need one argument
    argument :author, Types::AuthorInputType, required: true


    # argument :first_name, String, required: false, camelize: false ## to keep consistancy
    # argument :last_name, String, required: false
    # argument :yob, Int, required: false
    # argument :is_alive, Boolean, required: false
  end

  # side effect of this resolver is it creates an author


# now we can change this to reflect our new AuthorInputType
  def create_author(author:)
    # needs to be turned to hash for rails conventions
    Author.create author.to_h
  end


  # def create_author(first_name:, last_name:, yob:, is_alive:)
  #   Author.create first_name: first_name,
  #                 last_name: last_name,
  #                 yob: yob,
  #                 is_alive: is_alive
  # end

# 2nd way of creating mutation
  # field :create_author, Types::AuthorType, mutation: Mutations::CreateAuthor

# UPDATE AUTHOR
  field :update_author, Boolean, null: false, description: "Update an author" do
    argument :author, Types::AuthorInputType, required: true
  end
# then resolve this field
  def update_author(author:)
    existing = Author.where(id: author[:id]).first
    existing&.update author.to_h
  end

# DELETE AUTHOR
  field :delete_author, Boolean, null: false, description: "Delete an author" do
    argument :id, ID, required: true
  end

  def delete_author(id:)
    Author.where(id:id).destroy_all
    true
  end



end

