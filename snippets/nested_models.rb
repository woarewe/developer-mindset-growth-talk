# Bad

# app/models/user.rb
class User < ApplicationRecord
  has_many :user_posts
  has_many :user_comments
end

# app/models/user_post.rb
class UserPost < ApplicationRecord
  belongs_to :user
end

# app/models/user_comment.rb
class UserComment < ApplicationRecord
  belongs_to :user
end

def serialize(user)
  user.as_json.merge(
    posts: user.user_posts.map(&:as_json),
    comments: user.user_comments.map(&:as_json)
  )
end

# Good

# app/models/user.rb
class User < ApplicationRecord
  has_many :posts, class_name: 'Post'
  has_many :comments, class_name: 'Comment'
end

# app/models/user/post.rb
class User
  class Post < ApplicationRecord
    belongs_to :user
  end
end

# app/models/user/comment.rb
class User
  class Comment < ApplicationRecord
    belongs_to :user
  end
end

def serialize(user)
  user.as_json.merge(
    posts: user.posts.map(&:as_json),
    comments: user.comments.map(&:as_json)
  )
end

