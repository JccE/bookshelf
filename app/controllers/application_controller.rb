class ApplicationController < ActionController::Base

# for graphiql ######### might be wrong, this is for testing graphql
  protect_from_forgery unless: -> { request.format.json? }
end
