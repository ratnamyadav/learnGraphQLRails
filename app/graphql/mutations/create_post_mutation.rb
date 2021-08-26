module Mutations
  class CreatePostMutation < BaseMutation
    field :post, Types::PostType, null: false

    argument :title, String, required: true
    argument :body, String, required: true
    argument :user_id, Integer, required: true

    def resolve(title:, body:, user_id:)
      post = Post.new(title: title, body: body, user_id: user_id)
      if post.save
        {
          post: post,
          errors: []
        }
      else
        {
          post: nil,
          errors: post.errors
        }
      end
    end
  end
end
