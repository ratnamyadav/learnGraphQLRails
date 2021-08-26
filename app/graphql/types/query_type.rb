module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :users, [Types::UserType], null: false do
      description 'Returns all users'
    end
    field :posts, [Types::PostType], null: false do
      description 'Returns all posts'
    end

    def users
      User.all
    end

    def posts
      Post.all
    end
  end
end
