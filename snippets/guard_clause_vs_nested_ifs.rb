# Bad

def posts(user)
  if user
    if user.deleted?
      []
    else
      user.posts
    end
  else
    []
  end
end

# God

def posts(user)
  return [] unless user
  return [] if user.deleted?

  user.posts
end