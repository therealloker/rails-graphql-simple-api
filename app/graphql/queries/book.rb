module Queries
  class Book < BaseQuery
    description 'Find a book by ID'

    argument :id, ID, required: true

    type Types::BookType, null: false

    def resolve(id:)
      ::Book.find(id)
    rescue ActiveRecord::RecordNotFound => e
      raise GraphQL::ExecutionError.new(e.message, extensions: { code: Constants::INPUT_ERROR })
    end
  end
end
